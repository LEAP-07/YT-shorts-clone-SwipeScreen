import 'package:flutter/material.dart';

import 'package:youtube_shorts_clone/util/post_template.dart';

class MyPostOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostTemplate(
      username: 'Vasudev',
      videoDescription: 'kr dungi khatam...bachh ke rhna',
      numberOfLikes: "1.2M",
      numberOfComments: "1212",
      numberOfShares: "122",
      userPost: Container(
        color: Colors.deepPurple[400],
      ),
    );
  }
}
