import 'package:flutter/material.dart';
import 'package:flutter_mpin/mpin/mpin_animation.dart';
import 'package:flutter_mpin/mpin/mpin_widget.dart';



class MPinPage extends StatefulWidget {
  const MPinPage({Key? key}) : super(key: key);

  @override
  State<MPinPage> createState() => _MPinPageState();
}

class _MPinPageState extends State<MPinPage> {
  MPinAnimationController animationController = MPinAnimationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // MPinAnimation(controller: animationController),
                    MPinWidget(pinLength: 4),
                      MaterialButton(onPressed: (){
                        animationController.animate();},
                        color: Colors.white,
                        child: const Text("Animate", style: TextStyle(fontSize: 24),),
                    )
                  ],
                ),
              ),
            )
          ],
      ),
    );
  }
}
