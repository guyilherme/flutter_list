import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  Page({Key key}) : super(key: key);

  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticia"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Texto"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/'
                );
              },
            ),
            RaisedButton(
              child: Text("Texto"),
              onPressed: () {
                Navigator.pop(
                  context
                );
              },
            )
          ],
        )
      )
    );
  }
}