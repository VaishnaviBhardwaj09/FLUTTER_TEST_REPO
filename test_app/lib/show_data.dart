import 'package:flutter/material.dart';
import 'package:test_app/api_interface.dart';
import 'package:test_app/user_model.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late List<UserModel> userData;
  @override
  void initState() {
    super.initState();
    userData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () async {
              ApiInterface.instance.getUserData();
            },
            child: FutureBuilder(
              future: ApiInterface.instance.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: userData.length,
                      itemBuilder: (context, index) {
                        ListTile(
                          leading: Text("userId: ${userData[index].userId}"),
                          title: Text("userId: ${userData[index].that}"),
                          subtitle: Text("userId: ${userData[index].body}"),
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  getData() async {
    return await ApiInterface.instance.getUserData();
  }
}
