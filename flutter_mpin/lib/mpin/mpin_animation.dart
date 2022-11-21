import 'package:flutter/material.dart';

class MPinAnimationController{
  late void Function() animate;
}

class MPinAnimation extends StatefulWidget {
  final MPinAnimationController controller;
  const MPinAnimation({Key? key, required this.controller}) : super(key: key);

  @override
  State<MPinAnimation> createState() => _MPinAnimationState(controller);
}

class _MPinAnimationState extends State<MPinAnimation> with SingleTickerProviderStateMixin{
 late AnimationController _controller;
 late Animation<double> _sizeAnimation;
 late Animation<double> _opacityAnimation;
 String pin ="";
 void animate(){
   _controller.forward();
   setState(() {
   });
 }
 void clear(){
   setState(() {
   });
 }
  _MPinAnimationState(controller){
    controller?.animate = animate;
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _controller.addListener(() {
      if(_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      }
      setState(() {});
    });
    _sizeAnimation = Tween<double>(begin: 24, end: 72).animate(_controller);
    _opacityAnimation= Tween<double>(begin: 0, end: 1).animate(_controller);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      alignment: Alignment.center,
      child: Container(
        height: _sizeAnimation.value,
        width: _sizeAnimation.value,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_sizeAnimation.value / 2),
          color: Colors.white,
        ),
        child: Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            scale: _sizeAnimation.value / 48,
            child: Text(
              pin,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
