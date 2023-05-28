import 'package:flutter/material.dart';
import 'package:youtube_shorts_clone/util/video_tile.dart';
import '../models/postmodel.dart';
// import '../posts/mypost_1.dart';
import '../services/services.dart';
import '../util/post_template.dart';
// import '../posts/mypost_1.dart';
import 'dart:convert';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
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
      print("The response if RECIEVED SUCCESSFULLY!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
            int? count = post?.reaction.count ?? 0;
            int? comments = post?.comment.count ?? 0;

            final videoDescription = post?.submission.description ?? '';
            final url = post?.creator.pic ?? "heh";
            final link_video = post?.submission.mediaUrl ?? "";
            return PostTemplate(
                url: url,
                username: username,
                videoDescription: videoDescription,
                numberOfLikes: count,
                numberOfShares: "",
                numberOfComments: comments,
                userPost: VideoTile(
                  link: link_video,
                ));
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
