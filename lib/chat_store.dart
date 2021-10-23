import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'api_client.dart';
import 'chat.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

// The store-class
abstract class _ChatStore with Store {
  String url =
      'https://itis-chat-app-ex.herokuapp.com/';

  @observable
  ObservableList<Chat> chat = ObservableList.of([]);

  @action
  void fetchChat() {
    RestClient restClient = RestClient(Dio());
    restClient.getChat().then((List<Chat> chat) {
      chat.map((e) => this.chat.add(e));
    }).catchError((error) {
      print(error.toString());
    });
  }
}