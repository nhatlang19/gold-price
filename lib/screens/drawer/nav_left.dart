import 'package:flutter/material.dart';

class NavLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Luan Nguyen'),
            accountEmail: Text('luan.nguyen29111987@gmail.com'),
            currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text(
                  'LN',
                  style: new TextStyle(fontSize: 40.0),
                )),
            decoration: BoxDecoration(color: new Color(0xFF282E3D)),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cài đặt'),
            onTap: () {
              // This line code will close drawer programatically....
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Giới thiệu'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Liên hệ'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
