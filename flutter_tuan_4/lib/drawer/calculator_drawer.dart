import 'package:flutter/material.dart';

class CalculatorDrawer extends StatelessWidget {
  const CalculatorDrawer({super.key});

  Widget drawerItem(IconData icon, String title) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Scrollbar(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Calculator",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              drawerItem(Icons.calculate, "Standard"),
              drawerItem(Icons.science, "Scientific"),
              drawerItem(Icons.show_chart, "Graphing"),
              drawerItem(Icons.code, "Programmer"),
              drawerItem(Icons.date_range, "Date calculation"),

              const Divider(),

              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Converter",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              drawerItem(Icons.attach_money, "Currency"),
              drawerItem(Icons.square_foot, "Volume"),
              drawerItem(Icons.straighten, "Length"),
              drawerItem(Icons.monitor_weight, "Weight and mass"),
              drawerItem(Icons.thermostat, "Temperature"),
              drawerItem(Icons.bolt, "Energy"),
              drawerItem(Icons.crop_square, "Area"),
              drawerItem(Icons.speed, "Speed"),

              const Divider(),

              drawerItem(Icons.settings, "Settings"),
            ],
          ),
        ),
      ),
    );
  }
}
