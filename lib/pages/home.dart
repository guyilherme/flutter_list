import 'package:flutter/material.dart';
import 'noticias.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final feedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.url,
              controller: feedController,
              decoration: InputDecoration(
                labelText: "Link do RSS"
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Esse campo ta vazio";
                }
              },
            ),
            RaisedButton(
              child: Text("Cadastrar"),
              color: Colors.amber,
              textColor: Colors.white,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(feedController.text); 
                }
              },
            )
          ],
        ),
      ),
      )
    );
  }
}