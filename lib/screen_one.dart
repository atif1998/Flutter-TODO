import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screen_two.dart';


class ScreenOne extends StatefulWidget {
  const ScreenOne({ Key? key }) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("screen one")
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children:
        [
          Center(child:TextButton(onPressed:(){
            // Navigator.pop(context);
            // Get.to(ScreenTwo());
            Get.toNamed('/screenTwo');
          },child:Text("go to two")))
        ]
      )
    );
  
  }
}