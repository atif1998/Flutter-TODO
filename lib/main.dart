// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'screens/home_screen.dart';
// import 'screens/add_task_screen.dart';
// import 'providers/task_provider.dart';

// void main() {
//   runApp(MyTodoApp());
// }

// class MyTodoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => TaskProvider(),
//       child: MaterialApp(
//          debugShowCheckedModeBanner: false,
//         title: 'Todo App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         initialRoute: '/',
//         routes: {
//           '/': (ctx) => HomeScreen(),
//           '/add-task': (ctx) => AddTaskScreen(),
        
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Opacity Demo';
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool _visible = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: AnimatedOpacity(
//           opacity: _visible ? 1.0 : 0.0,
//           duration: const Duration(milliseconds: 500),
          
//           child: Container(
//             width: 150,
//             height: 150,
//             color: Colors.blue[200],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _visible = !_visible;
//           });
//         },
//         tooltip: 'Toggle Opacity', // Tooltip added here
//         child: const Icon(Icons.flip),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Flutter demo",
//       theme: new ThemeData(
//         primarySwatch: Colors.red,
//       ),
//     );
//   }
// }
// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);
  
//   final String title;

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int counter=0;
//   void increment(){
//     setState((){
//       counter++;
//     })

//   }
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar:new AppBar(
//         title:new Text(widget.title)
//       ),
//       body: new Center(
//       child:new Column(

//       )
//       )
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  int _value1 = 0;
  int _value2 = 0;
  bool _check1=false;
  bool _check2=false;
  String _date = '';

   double _value = 0.0;
  void _setvalue(double value) => setState(() => _value = value);

  void _setCheck1(bool value)=>setState(()=>_check1=value);
  void _setCheck2(bool value)=>setState(()=>_check2=value);

    Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2099)
    );
   if(picked != null) setState(() => _date = picked.toString());     
  }
  

  /*
  void _setValue1(int value) => setState(() => _value1 = value);
  void _setValue2(int value) => setState(() => _value2 = value);

  Widget makeRadios() {
    List<Widget> list = new List<Widget>();

    for(int i = 0; i < 3; i++){
      list.add(new Radio(value: i, groupValue: _value1, onChanged: _setValue1));
    }

    Column column = new Column(children: list,);
    return column;
  }
  */
  
  
void _setValue1(int? value) => setState(()=> _value1 = value!);
void _setValue2(int? value) => setState(()=> _value2 = value!);
 
Widget makeRadios () {
 
  List<Widget> list = <Widget> [];
  for (int i=0; i < 3; i ++){
    list.add(new Radio(value: i, groupValue: _value1, onChanged: _setValue1));
  }
  Column column= Column (children: list ,);
  return column;
}

  Widget makeRadioTiles() {
   List<Widget> list = <Widget> [];

    for(int i = 0; i < 3; i++){
      list.add(new RadioListTile(
        value: i,
        groupValue: _value2,
        onChanged: _setValue2,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: new Text('Item: ${i}'),
        subtitle: new Text('sub title'),

      ));
    }

    Column column = new Column(children: list,);
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                // makeRadios(),
                // makeRadioTiles(),
                Switch(value:_check1,onChanged:_setCheck1),
                SwitchListTile(
                  value:_check2,onChanged:_setCheck2,
                  title:new Text("Hello",style: new TextStyle(
                    fontWeight:FontWeight.bold,
                    color:Colors.red,
                  ))
                ),
                Text('Value: ${(_value * 100).round()}'),
             Slider(value: _value, onChanged: _setvalue),
              Text(_date),
              ElevatedButton(onPressed: _selectDate, child: new Text('Click me')),

              ],
            ),
          )
      ),
    );
  }
}

