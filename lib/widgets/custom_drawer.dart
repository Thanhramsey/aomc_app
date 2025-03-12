import 'package:flutter/material.dart';
import '../screens/info_screen.dart';
import '../screens/report_screen.dart';
import '../screens/action_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: Text("Thông tin"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen()));
            },
          ),
          ListTile(
            title: Text("Báo cáo"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReportScreen()));
            },
          ),
          ListTile(
            title: Text("Action"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ActionScreen()));
            },
          ),
        ],
      ),
    );
  }
}
