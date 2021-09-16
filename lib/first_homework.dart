import 'package:flutter/material.dart';

class FirstHomework extends StatefulWidget {
  const FirstHomework({Key? key}) : super(key: key);

  final String title = "First homework";
  @override
  _FirstHomeworkState createState() => _FirstHomeworkState();
}

class _FirstHomeworkState extends State<FirstHomework> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
    );
  }
}

