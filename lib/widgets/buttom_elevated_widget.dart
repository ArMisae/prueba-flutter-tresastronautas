import 'package:flutter/material.dart';

class ButtomElevatedWidget extends StatelessWidget {
  final Icon icon;

  const ButtomElevatedWidget({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: icon,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: Colors.white,
        // padding: EdgeInsets.all(6),
      ),
    );
  }
}
