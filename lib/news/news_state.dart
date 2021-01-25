part of 'news_bloc.dart';


abstract class NewsState {}

class InitialNewsState extends NewsState {}

class Loading extends NewsState {}

class LoadedNews extends NewsState {
  List<Articles> list;

  LoadedNews({this.list});
}

class ErrorNews extends NewsState {
  String error;

  ErrorNews({this.error});
}
