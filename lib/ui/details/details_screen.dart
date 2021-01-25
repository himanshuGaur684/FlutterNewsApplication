import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/network/response/news_article.dart';
import 'package:transparent_image/transparent_image.dart';

class Detailscreen extends StatelessWidget {
  Articles args;

  Detailscreen(Object args) {
    this.args = args as Articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
      ),
      body: Column(
        children: [
          _buildImage(args.urlToImage),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(_validateString(args.title),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(_validateString(args.description),
                style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              _validateString(args.content),
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  _buildImage(String urlToImage) {
    if (urlToImage != null) {
      return FadeInImage.memoryNetwork(
        image: urlToImage,
        placeholder: kTransparentImage,
        height: 250,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        'images/notimg.png',
        width: 10,
        height: 250,
      );
    }
  }

  _validateString(String s) {
    if (s != null) {
      return s;
    } else {
      return '';
    }
  }
}
