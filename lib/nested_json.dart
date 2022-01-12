import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonNested extends StatefulWidget {
  @override
  _JsonNestedState createState() => _JsonNestedState();
}

class _JsonNestedState extends State<JsonNested> {
  List listUser = [];
  Future getDataUser() async {
    var resJson =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(resJson.body);
    setState(() {
      listUser = data;
      log('data user ${listUser[0]}');
    });
  }

  @override
  void initState() {
    getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index) {
          // return ListTile(
          //   title: Text("${listUser[index]['name']}"),
          // );
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.black),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data User',
                  style: TextStyle(fontSize: 18, color: Colors.amber),
                ),
                Text('${listUser[index]['name']}'),
                Text('${listUser[index]['username']}'),
                Text('${listUser[index]['email']}'),
                SizedBox(height: 5),
                Text(
                  'Address',
                  style: TextStyle(fontSize: 18, color: Colors.amber),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('${listUser[index]['address']['street']}'),
                Text('${listUser[index]['address']['suite']}'),
                Text('${listUser[index]['address']['city']}'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Company',
                  style: TextStyle(fontSize: 18, color: Colors.amber),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('${listUser[index]['company']['name']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
