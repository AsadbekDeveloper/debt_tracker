import 'package:flutter/material.dart';
import '../common/avatar.dart';
import '../screens/profile_screen.dart';
import '../screens/debtors_screen.dart';
import '../screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({
    Key? key,
  }) : super(key: key);
  Future<User> getUser() async {
    var user =  _auth.currentUser!;
    return user;
  }

  final _auth = FirebaseAuth.instance;

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
            child: FutureBuilder(
                future: getUser(),
                builder: ((context, snapshot) {
                  return Container(
                    height: 150,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              tapHandle(ProfileScreen.id);
                            },
                            child: const Hero(
                                tag: 'profile_pic', child: Avatar(size: 80))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.hasData
                                ? snapshot.data!.displayName.toString()
                                : 'Unknown user'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(snapshot.hasData
                                ? snapshot.data!.email.toString()
                                : 'Unknown user'),
                          ],
                        )
                      ],
                    ),
                  );
                })),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Debtors"),
            onTap: () {
              tapHandle(DebtorsScreen.id);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text("Contacts"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart_sharp),
            title: const Text("Statistics"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              tapHandle(ProfileScreen.id);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () {
              _auth.signOut();
              Navigator.of(context).pushReplacementNamed(MyLogin.id);
            },
          ),
          const AboutListTile(
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
