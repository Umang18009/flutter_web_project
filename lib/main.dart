import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_project/view/login_view/login_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: LoginScreen()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Web",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton.icon(onPressed: () {

            }, label: Row(
              children: [
                Icon(CupertinoIcons.person_circle_fill,color: Colors.green,),
                SizedBox(width: 10,),
                Text("Login")
              ],
            )),
          )
        ],
      ),
      drawer: Container(
        width: 200,
        color: Colors.white,
      ),
    );
  }
}
