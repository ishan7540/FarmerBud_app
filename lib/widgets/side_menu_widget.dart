import 'package:fitness_dashboard_ui/const/constant.dart';
import 'package:fitness_dashboard_ui/data/side_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:fitness_dashboard_ui/screens/parameters_page.dart';
import 'package:fitness_dashboard_ui/screens/npk_values_page.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        border: Border.all(color: Colors.grey, width: 4),
      ),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: isSelected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });

          if (data.menu[index].title == 'Parameters') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ParametersPage()),
            );
          } else if (data.menu[index].title == 'NPK values') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NPKValuesPage()),
            );
          }
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
