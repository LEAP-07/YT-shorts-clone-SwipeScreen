import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/postmodel.dart';
import '../services/services.dart';
import '../util/ScrollableListView.dart';

// ignore: must_be_immutable
class ListViewScreen extends StatefulWidget {
  List<Post>? postModel;

  ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Post>? postModel;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
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
      print("Response received successfully in ListViewScreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Project",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: postModel?.length ?? 0,
        itemBuilder: (context, index) {
          if (postModel == null || postModel!.isEmpty) {
            return SizedBox(); // Return an empty widget if postModel is null or empty
          }
          final post = postModel?[index];
          final thumbnail_link = post?.submission.thumbnail ?? "";
          final name = post?.creator.name ?? "";
          final handle = post?.creator.handle ?? 'Unknown';
          return ScrollableListView(
            handle: handle,
            thumbnail_url: thumbnail_link,
            name: name,
          );
        },
      ),
    );
  }
}
