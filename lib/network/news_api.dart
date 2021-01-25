import 'package:dio/dio.dart';
import 'package:flutter_news/network/response/news_response.dart';
import 'package:retrofit/http.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class NewsApi{
  factory NewsApi(Dio dio)=_NewsApi;

  @GET('top-headlines')
  Future<NewsResponse> getAllNews(
      @Query('country')String country,
      @Query('category')String category,
      @Query('apiKey')String apiKey,
      );

}