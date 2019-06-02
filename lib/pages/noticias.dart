import 'package:flutter/material.dart';
import '../data/get_data.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasPage extends StatefulWidget {
  final String feed;

  NoticiasPage({Key key, this.feed}) : super(key: key);

  _NoticiasPageState createState() => _NoticiasPageState(this.feed);
}

class _NoticiasPageState extends State<NoticiasPage> {
  final String feed;
  Future<List> noticias;

  _NoticiasPageState(this.feed);

  @override
  Widget build(BuildContext context) {
    GetData rss = new GetData();

    noticias = rss.read(url: this.feed);

    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias"),
        leading: Icon(Icons.rss_feed),
      ),
      body: FutureBuilder(
          future: noticias,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return messageTemplate(title: "Carregando noticias", icon: Icons.refresh, size: 80);
              default:
                if (snapshot.hasError) {
                  return messageTemplate(title: "Deu erro", icon: Icons.error, size: 80);
                }
                return listNoticias(snapshot.data);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    );
  }

  messageTemplate({String title, IconData icon, double size,}) {
    if (size == null) {
      size = 40;
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: size,
          ),
          Text(title)
        ],
      ),
    );
  }

  listNoticias(List noticias){
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: noticias.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    _launchURL(url: noticias[index]['link']);
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 180,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Image.network(
                                noticias[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                              ),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.open_in_browser),
                        title: Text(noticias[index]['title']),
                      ),
                    ],
                  ),
                )
              );
            },
          ),
        )
      ],
    );
  }

  _launchURL({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}