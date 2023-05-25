import 'package:flutter/material.dart';

import 'package:youtube_shorts_clone/util/post_template.dart';

class MyPost3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostTemplate(
      username: 'bole chutiya',
      videoDescription: 'haye m ho gyi chutiya',
      numberOfLikes: "7 Crore",
      numberOfComments: "hup",
      numberOfShares: "hup",
      userPost: Container(
        color: Colors.pink[200],
      ),
    );
  }
}
