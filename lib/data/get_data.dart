import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class GetData {
  String image;

  Future<List> read ({String url}) async {
    http.Client client = http.Client();
    dynamic data = await client.get(url);
    xml.XmlDocument rss = xml.parse(data.body);
    print(rss);

    List noticias = [];

    rss.findAllElements('item').forEach(
      (node) {
        if (node.findElements('media:content').isNotEmpty) {
          image = node.findElements('media:content').single.getAttribute('url').toString();
        } else {
          image = 'https://place-hold.it/800x800&text=Noticia%20Sem%20Image';
        }
        noticias.add({
          'title': node.findElements('title').single.text,
          'link': node.findElements('link').single.text,
          'image': image
        });
      });

      return noticias;
  }

}