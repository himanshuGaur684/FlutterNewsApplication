import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/news/news_bloc.dart';
import 'package:flutter_news/routing/routing_file.dart';
import 'package:flutter_news/ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsBloc(InitialNewsState()),
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RoutingTable.generateRoute,
        title: 'News Application',
        home: HomeScreen(),
      ),
    );
  }
}
