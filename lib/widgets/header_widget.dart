import 'package:fitness_dashboard_ui/const/constant.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            ),
          ),
        if (!Responsive.isMobile(context))
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: cardBackgroundColor,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                hintText: 'Search',
              ),
            ),
          ),
        if (Responsive.isMobile(context))
          Row(
            children: [
              InkWell(
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.grey,
                    ),
                  )),
            ],
          ),
      ],
    );
  }
}
