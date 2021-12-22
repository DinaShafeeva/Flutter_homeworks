import 'package:fl_homework/fourth_homework/post.dart';
import 'package:fl_homework/fourth_homework/post_view.dart';
import 'package:fl_homework/fourth_homework/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FourthHomework extends StatefulWidget {
  const FourthHomework({Key? key}) : super(key: key);

  final String title = "Instagram";

  @override
  _FourthHomeworkState createState() => _FourthHomeworkState();
}

class _FourthHomeworkState extends State<FourthHomework> {
  List<Post> posts = [];
  final PostsStore postsStore = PostsStore();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemBuilder: (ctx, i) {
            return PostWidget(postsStore.posts[i]);
          },
          itemCount: postsStore.posts.length,
        ),
      ),
    );
  }
}
