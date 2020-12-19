import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final int value;

  const Badge({
    Key key,
    this.child,
    this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final badge = Positioned(
      bottom: 0.0,
      right: 0.0,
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFFF54B64), Color(0xFFF78361)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            border: Border.all(color: Colors.white)),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        child,
        Visibility(visible: value > 0, child: badge),
      ],
    );
  }
}
