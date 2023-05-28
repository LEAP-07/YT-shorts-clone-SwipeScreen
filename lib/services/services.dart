import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
  Future<String?> fetchDataFromAPI() async {
    try {
      final url =
          Uri.parse('https://internship-service.onrender.com/videos?page=1');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Request was successful
        // final responseData = json.decode(response.body);
        final responseData = utf8.decode(response.bodyBytes);
        // Parse and return the API data
        return responseData;
      } else {
        // Request failed with an error status code
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // An error occurred while making the request
      print('Error: $e');
    }
    return null;
  }
}





// import 'package:flutter/foundation.dart';
// // import 'package:youtube_shorts_clone/models/postmodel.dart';
// import 'package:http/http.dart' as http;

// import '../models/postmodel.dart';

// class Services {

  









//   // Future<List<Object>?> fetchDataFromAPI() async {
//   //   try {
//   //     final url =
//   //         Uri.parse('https://internship-service.onrender.com/videos?page=0');
//   //     final response = await http.get(url);

//   //     if (response.statusCode == 200) {
//   //       // Request was successful
//   //       final responseData = response.body;
//   //       // Process and print the API data
//   //       return responseData;
//   //     } else {
//   //       // Request failed with an error status code
//   //       print('Request failed with status: ${response.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     // An error occurred while making the request
//   //     print('Error: $e');
//   //   }
//   // }
//   // getPosts() async {
//   //   print("inside getPost");

//   //   // Future<void> fetchDataFromAPI() async {
//   //   //   print("andar aagya uff");
//   //   // }

//   //   final client = http.Client();
//   //   final uri =
//   //       Uri.parse('https://internship-service.onrender.com/videos?page=0');

//   //   final response = await client.get(uri);

//   //   if (response.statusCode == 200) {
//   //     final json = response.body;
//   //     return postModelFromJson(json);
//   //   } else {
//   //     print("gand marr gyi");
//   //   }
//   // }
// }
