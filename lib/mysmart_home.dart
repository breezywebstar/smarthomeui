import 'package:flutter/material.dart';

class MySmartHome extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  MySmartHome({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 25,
        ),
        decoration: BoxDecoration(
            color: powerOn ? Colors.pink : Colors.grey[200],
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              iconPath,
              height: 65,
              color: powerOn ? Colors.white : Colors.black,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      smartDeviceName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: powerOn ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                RotatedBox(
                    quarterTurns: 1,
                    child: Switch(
                      value: powerOn,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
