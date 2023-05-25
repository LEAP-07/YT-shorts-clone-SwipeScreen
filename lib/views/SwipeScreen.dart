import 'package:flutter/material.dart';

import '../models/postmodel.dart';
import '../posts/mypost_1.dart';
import '../services/services.dart';
import '../util/post_template.dart';
// import '../posts/mypost_1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel>? postModel;

  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    //fetch data from api
    print("before get data");
    getData();
  }

  getData() async {
    print("before service");
    Services().fetchDataFromAPI();
    print("after service");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: PageView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return PostTemplate(
              username: 'flat tyre',
              videoDescription:
                  'kr dunga khatam...bachh ke rhna..allah-hu-akbar',
              numberOfLikes: "1.2M",
              numberOfComments: "1212",
              numberOfShares: "122",
              userPost: Container(
                color: Colors.deepPurple[400],
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
