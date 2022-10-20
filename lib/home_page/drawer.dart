import 'package:flutter/material.dart';
import '../common/avatar.dart';
import '../screens/profile_screen.dart';
import '../screens/debtors_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void tapHandle(id) {
      Navigator.of(context).pop();
      Navigator.pushNamed(context, id);
    }

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              height: 150,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        tapHandle(ProfileScreen.id);
                      },
                      child: Hero(tag: 'profile_pic', child: Avatar(size: 80))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Asadbek Janabaev'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('@janabaevasadbek'),
                    ],
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Debtors"),
            onTap: () {
              tapHandle(DebtorsScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Contacts"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bar_chart_sharp),
            title: Text("Statistics"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              tapHandle(ProfileScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          AboutListTile(
            icon: Icon(
              Icons.info,
            ),
            child: Text('About app'),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'Debt Tracker',
            applicationVersion: '1.0.0.0',
            applicationLegalese: '© 2022 Company',
          ),
        ],
      ),
    );
  }
}
