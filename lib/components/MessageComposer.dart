import 'package:flutter/material.dart';

class MessageComposer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black),
        ),
      ),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  hintText: "Type here...",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {},
                  )),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
