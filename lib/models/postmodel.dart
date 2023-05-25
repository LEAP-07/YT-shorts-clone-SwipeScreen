// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String message;
  Data data;

  PostModel({
    required this.message,
    required this.data,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<Post> posts;
  int page;
  int offset;

  Data({
    required this.posts,
    required this.page,
    required this.offset,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        page: json["page"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "page": page,
        "offset": offset,
      };
}

class Post {
  String postId;
  Creator creator;
  Comment comment;
  Reaction reaction;
  Submission submission;

  Post({
    required this.postId,
    required this.creator,
    required this.comment,
    required this.reaction,
    required this.submission,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        postId: json["postId"],
        creator: Creator.fromJson(json["creator"]),
        comment: Comment.fromJson(json["comment"]),
        reaction: Reaction.fromJson(json["reaction"]),
        submission: Submission.fromJson(json["submission"]),
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "creator": creator.toJson(),
        "comment": comment.toJson(),
        "reaction": reaction.toJson(),
        "submission": submission.toJson(),
      };
}

class Comment {
  int count;
  bool commentingAllowed;

  Comment({
    required this.count,
    required this.commentingAllowed,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        count: json["count"],
        commentingAllowed: json["commentingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "commentingAllowed": commentingAllowed,
      };
}

class Creator {
  String? name;
  String id;
  String handle;
  String pic;

  Creator({
    this.name,
    required this.id,
    required this.handle,
    required this.pic,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        name: json["name"],
        id: json["id"],
        handle: json["handle"],
        pic: json["pic"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "handle": handle,
        "pic": pic,
      };
}

class Reaction {
  int count;
  bool voted;

  Reaction({
    required this.count,
    required this.voted,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        count: json["count"],
        voted: json["voted"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "voted": voted,
      };
}

class Submission {
  Title title;
  String description;
  String mediaUrl;
  String thumbnail;
  String hyperlink;
  String placeholderUrl;

  Submission({
    required this.title,
    required this.description,
    required this.mediaUrl,
    required this.thumbnail,
    required this.hyperlink,
    required this.placeholderUrl,
  });

  factory Submission.fromJson(Map<String, dynamic> json) => Submission(
        title: titleValues.map[json["title"]]!,
        description: json["description"],
        mediaUrl: json["mediaUrl"],
        thumbnail: json["thumbnail"],
        hyperlink: json["hyperlink"],
        placeholderUrl: json["placeholderUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "description": description,
        "mediaUrl": mediaUrl,
        "thumbnail": thumbnail,
        "hyperlink": hyperlink,
        "placeholderUrl": placeholderUrl,
      };
}

enum Title { RANDOM_TITLE }

final titleValues = EnumValues({"Random Title": Title.RANDOM_TITLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
