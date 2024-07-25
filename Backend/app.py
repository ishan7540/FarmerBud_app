from flask import Flask, jsonify
from flask_cors import CORS
from data_fetcher import fetch_data  
import numpy as np
import pickle
import requests

app = Flask(__name__)

API_URL = 'https://api.thingspeak.com/channels/2187169/feeds.json?api_key=LELEVX9B3SDHSFZ9&results=800'
last_valid_data = None

with open('model_ph_t_c.pkl', 'rb') as model_file:
    model = pickle.load(model_file)

@app.route('/')
def index():
    return jsonify({'message': 'Hello, world!'})


@app.route('/fetch', methods=['GET'])
def fetch():
    global last_valid_data

    try:
        data = fetch_data(API_URL)
        if 'field1' in data and data['field1'] != '//////':#make this back to 4 in both places
        #        and data['field4'] != '655.35/655.35/255.00/6553.50/65535.00/65535.00/65535.00':
            field1_values = data['field1'].split('/')#make this back to 4
            columns = ['hp1', 'm1', 't1', 'c1', 'n1', 'p1', 'k1']
            data_dict = {var: float(val) for var, val in zip(columns, field1_values)}

            last_valid_data = data_dict
        else:
            if last_valid_data is None:
                raise Exception("No valid data available")
            data_dict = last_valid_data

        return jsonify(data_dict)
    except Exception as e:
        return jsonify({"Error": str(e)}), 500


@app.route('/prediction', methods=['GET'])
def predict():
    try:
        
        if last_valid_data is None:
            raise Exception("No valid data available from /fetch endpoint")

        data_dict = last_valid_data

        hp_t_c_array = np.array([data_dict.get('hp1', 0.0), data_dict.get('t1', 0.0), data_dict.get('c1', 0.0)])

        prediction = model.predict(hp_t_c_array.reshape(1, -1))

        return jsonify({"Prediction": prediction.tolist()})
    except Exception as e:
        return jsonify({"Error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
