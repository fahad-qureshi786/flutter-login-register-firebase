import 'package:firebaseflutterlogin/backend/user_model.dart';
import 'package:flutter/material.dart';

import 'api_service.dart';

class APIData extends StatefulWidget {
  const APIData({Key? key}) : super(key: key);

  @override
  _APIDataState createState() => _APIDataState();
}

class _APIDataState extends State<APIData> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!.cast<UserModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _userModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userModel![index].id.toString()),
                    Text(_userModel![index].username),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userModel![index].email),
                    Text(_userModel![index].website),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}