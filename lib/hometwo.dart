import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;


class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List<Photos> photolist = [];
  Future<List<Photos>> getPhotos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    print(data);
    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i['title'], url: i['url']);
        photolist.add(photos);
      }
      return photolist;
    }
    else{
      return photolist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two "),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
            future: getPhotos(),
            builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
            return ListView.builder(
              itemCount: photolist.length,
              itemBuilder: ((context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                ),
                title: Text(snapshot.data![index].title.toString() , style: TextStyle(fontSize: 14 , color: Colors.deepPurple) ,),
              );
            }));
          },))
        ],
      ),
    );
  }
}

class Photos{
  String title, url;
  Photos({required this.title , required this.url });
}