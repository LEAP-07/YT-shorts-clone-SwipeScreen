import 'package:flutter/material.dart';
import '../models/postmodel.dart';
// import '../posts/mypost_1.dart';
import '../services/services.dart';
import '../util/post_template.dart';
// import '../posts/mypost_1.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? postModel;

  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    //fetch data from api

    getData();
  }

  getData() async {
    // Services().fetchDataFromAPI();
    // dynamic responseData = await Services().fetchDataFromAPI();
    // Use the returned data as needed
    //print(responseData);

    //

    List<Post>? posts = [];

    dynamic responseData = await Services().fetchDataFromAPI();
    if (responseData != null) {
      Map<String, dynamic> responseBody = json.decode(responseData);
      if (responseBody.containsKey('data')) {
        Map<String, dynamic> data = responseBody['data'];
        if (data.containsKey('posts')) {
          List<dynamic> postsJson = data['posts'];
          posts = postsJson.map((json) => Post.fromJson(json)).toList();
        }
      }
    }

    setState(() {
      postModel = posts;
      isLoaded = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: PageView.builder(
          itemCount: postModel?.length ?? 0,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            if (postModel == null || postModel!.isEmpty) {
              return SizedBox(); // Return an empty widget if postModel is null or empty
            }
            final post = postModel?[index];
            final username = post?.creator.handle ?? 'Unknown';
            final videoDescription = post?.submission.description ?? '';
            final url = post?.creator.pic ?? "heh";

            return PostTemplate(
              url: url,
              username: username,
              videoDescription: videoDescription,
              numberOfLikes: "1.2M",
              numberOfComments: "1212",
              numberOfShares: "122",
              userPost: Container(
                // color: Colors.deepPurple[i],
                child: Center(child: Text('page : $index')),
              ),
            );
          }),
      // body: PageView(
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     MyPostOne(),
      //   ],
      // ),
    );
  }
}

class MyPost2 {}
