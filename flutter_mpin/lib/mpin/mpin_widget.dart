import 'package:flutter/material.dart';
import 'package:flutter_mpin/mpin/mpin_animation.dart';

class MPinController{
  late void Function(String) addInput;
  late void Function() delete;
  late void Function() notifyWrongInput;
}

class MPinWidget extends StatefulWidget {
  final int pinLength;
  final MPinController controller;
  const MPinWidget({Key? key, required this.pinLength, required this.controller}) : super(key: key);

  @override
  State<MPinWidget> createState() => _MPinWidgetState(controller);
}

class _MPinWidgetState extends State<MPinWidget> {
  late List<MPinAnimationController> _animationControllers;
  _MPinWidgetState(MPinController controller){
    controller.addInput = addInput;
    controller.delete = delete;
  }

  void addInput(String input){

  }
  void delete(){ }

  @override
  void initState() {
    _animationControllers = List.generate(widget.pinLength, (index) {
      return MPinAnimationController();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.pinLength, (index){
        return MPinAnimation(controller: _animationControllers[index],);
      }),
    );
  }
}
