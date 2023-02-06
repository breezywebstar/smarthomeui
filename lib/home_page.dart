import 'package:flutter/material.dart';

import 'mysmart_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List smartDevices = [
    ["Smart Light", "lib/icons/bulb.png", true],
    ["Smart TV", "lib/icons/tv.png", true],
    ["Smart AC", "lib/icons/ac.png", true],
    ["Smart FAN", "lib/icons/fan.png", true],
  ];

  void powerSwitch(bool value, index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 70,
                  ),
                  Icon(
                    Icons.person,
                    size: 70,
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Welcome Home,',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'RAYMOND IDU',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Smart Home',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: smartDevices.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return MySmartHome(
                      smartDeviceName: smartDevices[index][0],
                      iconPath: smartDevices[index][1],
                      powerOn: smartDevices[index][2],
                      onChanged: (value) => powerSwitch(value, index),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
