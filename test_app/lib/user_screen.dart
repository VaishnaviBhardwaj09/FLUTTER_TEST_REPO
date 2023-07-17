import 'package:flutter/material.dart';
import 'package:test_app/api_interface.dart';
import 'package:test_app/user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<User>> userDataList;

  @override
  void initState() {
    userDataList = ApiInterface().fetchUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "Display User Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: userDataList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List<User>? userDataList = snapshot.data;
            return ListView.builder(
              itemCount: userDataList!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Card(
                    color: const Color.fromARGB(255, 255, 170, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: 500,
                      child: Column(
                        children: [
                          Text(
                            'UserId : ${userDataList[index].userId.toString()}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            'Id : ${userDataList[index].id.toString()}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            'Title : ${userDataList[index].title!}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            'Body : ${userDataList[index].body!}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Data is not available"));
          }
        },
      ),
    );
  }
}
