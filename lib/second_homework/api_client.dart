import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fl_homework/second_homework/chat.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://itis-chat-app-ex.herokuapp.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/chat")
  Future<List<Chat>> getChat();

  @POST("/chat")
  Future<Chat> sendMessage(@Body() Chat chat);
}