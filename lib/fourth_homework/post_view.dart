import 'package:fl_homework/fourth_homework/post.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget(this.post);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.post.authorAvatar),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.post.authorName,
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const ImageIcon(AssetImage("resources/icons/more.png"),
                    size: 24),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage(widget.post.mediaList[0]),
                  fit: BoxFit.cover)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ImageIcon(AssetImage("resources/icons/like_red.png"),
                  size: 24),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon: const ImageIcon(AssetImage("resources/icons/comment.png")),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon: const ImageIcon(AssetImage("resources/icons/send.png")),
              onPressed: () {},
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon: const ImageIcon(AssetImage("resources/icons/bookmark.png")),
              onPressed: () {},
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    const Text('Нравится: '),
                    Text(widget.post.likesCount.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(widget.post.authorName.toString() + " ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.post.description.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
