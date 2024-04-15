import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screen_one.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         title:Text("getx")
//       ),
//       body:Column(
//         children:[
//           Card(
//           child:ListTile(
//             title:Text("GETX DIALOG"),
//             onTap:(){
//               Get.defaultDialog(
//                 title:"Delete",
//                 titlePadding:EdgeInsets.only(top:20),
//                 contentPadding:EdgeInsets.all(20),
//                 // middleText:"Are you sure you want to delete chat?",
//                 confirm: TextButton(onPressed:(){
//                   Get.back();
//                 },child:Text('OK')),
//                 cancel: TextButton(onPressed:(){},child:Text('Cancel')),
//                 content:Column(
//                   children:[
//                     Text('Cancel'),
//                     Text('Cancel'),
//                     Text('Cancel'),Text('Cancel')
//                   ]
//                 )
//               );
              
//             }
//           ),
//           ),
//            Card(
//           child:ListTile(
//             title:Text("GETX Bottom sheet"),
//             onTap:(){
//               Get.bottomSheet(
//                 Container(
//                  decoration:BoxDecoration(
//                   color:Colors.red,
//                   borderRadius:BorderRadius.circular(30)
//                  ),
//                   child:Column(
//                     children:[
//                       ListTile(
//                       onTap:(){
//                         Get.changeTheme(ThemeData.light());
//                       },
//                       leading:Icon(Icons.light_mode)  ,
//                       title:Text("light theme"),
//                       ), 
//                       ListTile(
//                       onTap:(){
//                           Get.changeTheme(ThemeData.dark());
//                       },
//                       leading:Icon(Icons.dark_mode)  ,
//                       title:Text("Dark theme"),
//                       )
//                     ]
//                   )
//                 )
//               );
              
//             }
//           ),
//           )
//         ]
//       ),
//       floatingActionButton: FloatingActionButton (onPressed:(){
//         Get.snackbar("atif","subscribe to my channel",
//         backgroundColor:Colors.blue,
//         onTap:(snap){

//         },
//         mainButton:TextButton(onPressed:(){},child:Text("Click")),
//         icon:Icon(Icons.add),
//         snackPosition:SnackPosition.BOTTOM);
//       })
//     );
//   }
// }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("getx tutorial")
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children:
        [
          Center(child:TextButton(onPressed:(){
            Get.toNamed('/screenOne', arguments: "Hello World!");
          //  Get.to(ScreenOne());
            // Navigator.push(context,MaterialPageRoute(builder:(context)=>ScreenOne()));
          },child:Text("first screen")))
        ]
      )
    );
  
  }
  }

    // body: Center(
      //   child:ElevatedButton(
      //     child: Obx(()=>Text(text.value+" "+count.value.toString())),
      //     onPressed:(){

      //       text.value="clicked";
      //       count.value++;
      //     }
      //   ),
      // )

    // return GetMaterialApp(
    //   title:"Flutter Demo",
    //   theme:ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //  home: const HomeScreen(),
    //  getPages:[
    //   GetPage(name:'/' , page:() => HomeScreen()),
    //   GetPage(name:'/screenOne' , page:()=>ScreenOne()),
    //   GetPage(name:'/screenTwo' , page:()=>ScreenTwo()),
    //  ]
    // );