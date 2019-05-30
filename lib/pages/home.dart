import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Texto"),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/noticias'
            );
          },
        ),
      )
    );
  }
}