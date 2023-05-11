// import 'dart:convert';

// import 'package:api/Models/comment_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;

// class CommentPage extends StatefulWidget {
//   const CommentPage({super.key});

//   @override
//   State<CommentPage> createState() => _CommentPageState();
// }

// class _CommentPageState extends State<CommentPage> {
//   List<Comment> commentlist = [];
//   Future<List<Comment>> getComment() async{
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1'));
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     if(response.statusCode == 200){
//       data.forEach((i) {
//         Map<String, dynamic> mapWithStringKeys = i.cast<String, dynamic>();
//         commentlist.add(Comment.fromJson(mapWithStringKeys));
//       });
//       return commentlist;
//     }
//     else{
//       return commentlist;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Comment Page"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                       return CircularProgressIndicator();
//                     } else {
//                       return ListView.builder(
//                           itemCount: commentlist.length,
//                           itemBuilder: ((context, index) {
//                             return Card(
//                               child: Column(),
//                             );
//                           }));
//             })
//             ),
//         ],
//       ),
//     );
//   }
// }