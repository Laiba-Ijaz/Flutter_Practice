import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/smart_device_box.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 35.0;
  final double verticalPadding = 25.0;

  //list of smart devices
  List mySmartDevices = [
    //Name, Icon, Power Status
    ["Smart Light", "assets/icons/light-bulb.png", true],
    ["Smart AC", "assets/icons/air-conditioner.png", true],
    ["Smart TV", "assets/icons/smart-tv.png", true],
    ["Smart Fan", "assets/icons/fan.png", true],
  ];
  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2] = value;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/icons/menu.png",
                    height: 35,
                    color: Colors.grey[800],
                  ),
                 Icon(
                   Icons.person,
                   size: 35,
                   color: Colors.grey[800],
                 ),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            //Welcome Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home",style: TextStyle(fontSize: 20, color:Colors.grey[700]),),
                  Text("Alen Jane",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 70
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey[800]
                ),),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1/1.3),
                    itemCount: mySmartDevices.length,
                    itemBuilder:(context, index){
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value)=>powerSwitchChanged(value, index),
                      );
                    }
                  ),
                )
            )
            //Custom app bar
            
          ],
        ),
      ),
    );
  }
}
