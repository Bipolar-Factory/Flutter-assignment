import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final String title;
  final Widget body;

  const HomeView({
    Key key,
    @required this.title,
    @required this.body,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _title = Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: HeaderText(
        text: title,
      ),
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title,
            Expanded(
              child: body,
            )
          ],
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  final bool isBig;
  final double fontSize;
  final TextAlign textAlign;

  const HeaderText({
    Key key,
    @required this.text,
    this.isBig = true,
    this.fontSize,
    this.textAlign,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _fontSize = fontSize != null
        ? fontSize
        : isBig
            ? 30.0
            : 15.0;
    final fontWeight = isBig ? FontWeight.w900 : FontWeight.w600;
    final color = isBig
        ? Theme.of(context).textTheme.bodyText1.color.withOpacity(0.7)
        : Theme.of(context).textTheme.bodyText2.color.withOpacity(0.8);

    return Text(
      text,
      style: TextStyle(
        fontSize: _fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
