import 'package:flutter/material.dart';
import 'package:youtube_shorts_clone/views/SwipeScreen.dart';

class ScrollableListView extends StatelessWidget {
  final String name;
  final String handle;
  final String thumbnail_url;

  ScrollableListView({
    required this.name,
    required this.handle,
    required this.thumbnail_url,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 110, 110, 110).withOpacity(0.3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                28), // Adjust the value as per your requirement
                            child: Image.network(
                              thumbnail_url,
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text('@$handle'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //button
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 43, 43),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                  ),
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SwipeScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
