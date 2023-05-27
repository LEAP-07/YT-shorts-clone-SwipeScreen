import 'package:flutter/material.dart';
import 'package:youtube_shorts_clone/util/LikeButton.dart';

import 'button.dart';

class PostTemplate extends StatelessWidget {
  final String username;
  final String videoDescription;
  final int numberOfLikes;
  final int numberOfComments;
  final String numberOfShares;
  final String url;
  final userPost;

  const PostTemplate({
    Key? key,
    required this.username,
    required this.videoDescription,
    required this.numberOfLikes,
    required this.numberOfShares,
    required this.numberOfComments,
    required this.userPost,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final desiredWidth = 0.1 * screenWidth;
    return Scaffold(
      body: Stack(
        children: [
          // user post is at back
          userPost,
          // username and caption
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
                              return const CircularProgressIndicator();
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
                      Text(
                        "@$username",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: videoDescription,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15.0,
            right: 15.0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyLikeButton(
                      icon: Icons.thumb_up,
                      number: numberOfLikes,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyButton(
                      icon: Icons.chat_bubble_outlined,
                      number: numberOfComments,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Icon(
                      Icons.send_rounded,
                      size: 32,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
