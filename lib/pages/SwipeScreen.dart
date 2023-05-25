import 'package:flutter/material.dart';
import 'package:youtube_shorts_clone/posts/mypost_2.dart';

import '../posts/mypost_1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        children: [
          MyPost1(),
          MyPost3(),
        ],
      ),
    );
  }
}

class MyPost2 {}
