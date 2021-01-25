import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/network/response/news_article.dart';
import 'package:flutter_news/news/news_bloc.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get image => 'images/img.png';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NewsBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('News Application'),
        ),
        body: _buildBody(context, bloc));
  }

  _buildBody(BuildContext context, NewsBloc bloc) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, NewsState state) {
        if (state is InitialNewsState) {
          bloc.add(NewsEvent.fetchNews);
        }
        if (state is LoadedNews) {
          return _buildList(context, state.list);
        }
        if (state is Loading) {}
        if (state is ErrorNews) {
          return Center(
            child: Text(state.error),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  _buildList(BuildContext context, List<Articles> list) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/detail_screen',arguments:list[index]);
          },
          child: Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _makeImage(list[index].urlToImage),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    list[index].title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    _validate(list[index].description),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: list.length,
    );
  }

  _makeImage(String url) {
    if (url != null) {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image:url,
        height: 250,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        'images/notimg.png',
        height: 250,
        width: 10,
        fit: BoxFit.scaleDown,
      );
    }
  }

  _validate(String desc){
    if(desc!=null){
      return desc;
    }else{
      return '';
    }
  }
}
