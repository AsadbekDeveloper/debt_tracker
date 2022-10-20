import 'package:flutter/material.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  static final id = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(children: [
        Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 3,
              child: Hero(
                tag: 'profile_pic',
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Linnie Ramsey',
                style: headerNormal,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CardItem(
                    icon: Icon(Icons.phone),
                    type: 'Mobile',
                    value: '221-067-4004',
                  ),
                  CardItem(
                    icon: Icon(Icons.mail),
                    type: 'Email',
                    value: 'liricooo@gmail.com',
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                CardItem(
                    icon: Icon(Icons.bar_chart), type: 'Stats', value: '100\$')
              ]),
            ),
          ),
        )
      ]),
    );
  }
}

class CardItem extends StatelessWidget {
  final icon;
  final type;
  final value;
  const CardItem({
    Key? key,
    required this.icon,
    required this.type,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        children: [
          Container(
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: descSmall.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  value,
                  style: headerSmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
