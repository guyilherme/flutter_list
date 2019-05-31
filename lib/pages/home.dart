import 'package:flutter/material.dart';
import '../data/bd.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final feedController = TextEditingController();
  List feed = [];

  void initState() {
    final SaveLocal salvarDados = new SaveLocal(feedList: feed);
    salvarDados.read().then((data) {
      setState(() {
        feed = data;
      }); 
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SaveLocal salvarDados = new SaveLocal(feedList: feed);

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
            Expanded(
              child: ListView.builder(
                itemCount: feed.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(feed[index]),
                    leading: Icon(Icons.rss_feed),
                    onTap: () {
                      print(index.toString());
                    },
                  );
                },
              ),
            ),
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
                  setState(() {
                    feed.add(feedController.text);
                    feedController.text = "";

                    salvarDados.save(feed);
                  });
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