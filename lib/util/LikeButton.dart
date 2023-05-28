import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MyLikeButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final int number;

  MyLikeButton({super.key, this.icon, required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LikeButton(
          size: 32,
          likeCount: number,
          countPostion: CountPostion.bottom,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : null,
              size: 32,
            );
          },
          onTap: (bool isLiked) {
            // Handle the like button tap event here
            return Future.value(!isLiked);
          },
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
