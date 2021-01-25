import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news/network/news_api.dart';
import 'package:flutter_news/network/response/news_article.dart';
import 'package:flutter_news/network/response/news_response.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(NewsState initialState) : super(initialState);

  @override
  NewsState get initialState => InitialNewsState();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    switch (event) {
      case NewsEvent.fetchNews:
        yield Loading();
        try {
          final retro =
              NewsApi(Dio(BaseOptions(contentType: 'application/json')));
          NewsResponse list = await retro.getAllNews(
              'in', 'sports','436a7b507ee5433bafa1ad67c8eff93b');
          yield LoadedNews(list: list.articles);
        } on HttpException {
          yield ErrorNews(error: 'Exception Occured');
        } on Exception {

          yield ErrorNews(error: 'Error Exception');
        }
    }
  }
}
