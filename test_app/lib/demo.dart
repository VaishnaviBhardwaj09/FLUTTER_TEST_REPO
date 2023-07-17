import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome> Data = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getDataFromServer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Innobit"),
      ),
      body: ListView.builder(
          itemCount: Data.length,
          //itemCount: 10,
          itemBuilder: (context, index) {
            return Text(
              Data[index].title.toString(),
              style: const TextStyle(),
            );
          }),
    );
  }

  Future<void> _getDataFromServer() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      print(response);
      List<Welcome> data = [];
      for (var e in response.data) {
        data.add(Welcome.fromJson(e));
      }

      setState(() {
        Data = data;
      });
    } catch (e) {
      print(e);
    }
  }
}
