import 'package:flutter/material.dart';

class NoticiasPage extends StatefulWidget {
  final String feed;

  NoticiasPage({Key key, this.feed}) : super(key: key);

  _NoticiasPageState createState() => _NoticiasPageState(this.feed);
}

class _NoticiasPageState extends State<NoticiasPage> {
  final String feed;

  _NoticiasPageState(this.feed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(this.feed),
          onPressed: () {
            // Navigator.pushNamed(
            //   context,
            //   '/noticias/page'
            // );
          },
        ),
      )
    );
  }
}