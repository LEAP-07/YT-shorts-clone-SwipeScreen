import 'package:flutter/material.dart';

import 'button.dart';

class PostTemplate extends StatelessWidget {
  final String username;
  final String videoDescription;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfShares;
  final String url;
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
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final desiredWidth = 0.1 * screenWidth;
    return Scaffold(
      body: Stack(
        children: [
          //user post is at back
          userPost,
          //username and caption
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 45, bottom: 15),
            child: Container(
              width: screenWidth * 3.25 / 4,
              alignment: const Alignment(-1, 1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(desiredWidth / 2),
                          child: Image.network(
                            url,
                            width: desiredWidth,
                            height: desiredWidth,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                // Image is fully loaded
                                return child;
                              } else {
                                // Placeholder or loading indicator
                                return CircularProgressIndicator();
                                // return Image.asset(
                                //   'assets/images/placeholder.png', // Replace with your placeholder image asset path
                                //   width: desiredWidth,
                                //   height: desiredWidth,
                                //   fit: BoxFit.cover,
                                // );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("@$username",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
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
            padding: const EdgeInsets.only(right: 8.0),
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
