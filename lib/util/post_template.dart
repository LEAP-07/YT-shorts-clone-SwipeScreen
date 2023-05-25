import 'package:flutter/material.dart';

import 'button.dart';

class PostTemplate extends StatelessWidget {
  final String username;
  final String videoDescription;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfShares;
  // ignore: prefer_typing_uninitialized_variables
  final userPost;
  const PostTemplate({
    super.key,
    required this.username,
    required this.videoDescription,
    required this.numberOfLikes,
    required this.numberOfShares,
    required this.numberOfComments,
    required this.userPost,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //user post is at back
          userPost,
          //username and caption
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: const Alignment(-1, 1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("@$username",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: videoDescription,
                          style: const TextStyle(color: Colors.white)),
                    ])),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: const Alignment(1, 1),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                MyButton(
                  icon: Icons.thumb_up,
                  number: numberOfLikes,
                ),
                MyButton(
                  icon: Icons.thumb_down,
                  number: "Dislike",
                ),
                MyButton(
                  icon: Icons.chat_bubble_outlined,
                  number: numberOfComments,
                ),
                MyButton(
                  icon: Icons.share,
                  number: numberOfShares,
                ),
                MyButton(
                  icon: Icons.send,
                  number: "Send",
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
