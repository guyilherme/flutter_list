import 'package:flutter/material.dart';

class NoticiasPage extends StatefulWidget {
  NoticiasPage({Key key}) : super(key: key);

  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Texto"),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/noticias/page'
            );
          },
        ),
      )
    );
  }
}