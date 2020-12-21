import 'package:flutter/material.dart';

class SlideIn extends StatefulWidget {
  final Widget child;

  const SlideIn({Key key, this.child}) : super(key: key);
  @override
  _SlideInState createState() => _SlideInState();
}

class _SlideInState extends State<SlideIn> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child){
        return Opacity(
          opacity: 1-_animation.value,
          child: Container(
            padding: EdgeInsets.only(top: _animation.value*10),
            alignment: Alignment.topLeft,
            child: widget.child,
          ),
        );
      },
    );
  }
}
