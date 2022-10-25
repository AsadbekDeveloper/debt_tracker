import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;

  const Avatar({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: Colors.grey,
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.person,
          size: size / 2,
          color: Colors.white,
        ),
      ),
    );
  }
}
