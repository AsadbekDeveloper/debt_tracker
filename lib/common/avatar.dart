import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final index;
  final double size;

  const Avatar({
    Key? key,
    required this.index,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: Colors.grey,
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$index'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
