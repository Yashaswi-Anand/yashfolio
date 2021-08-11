import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Screens/homePage.dart';
import 'package:get/get.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Demo(),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Yashaswi Anand")),
      ),
      body:  VxDevice(
        mobile: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Yash",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 30),),
              SizedBox(height: 10,),
              Text("CSE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown,fontSize: 30),),
              SizedBox(height: 10,),
              Text("Btech",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 30),),
              SizedBox(height: 10,),
              Text("Bihar",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown,fontSize: 30),),
            ],
          ),
        ), web: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Yash",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 30),),
            SizedBox(width: 10,),
            Text("CSE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown,fontSize: 30),),
            SizedBox(width: 10,),
            Text("Btech",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 30),),
            SizedBox(width: 10,),
            Text("Bihar",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown,fontSize: 30),),
          ],
      ),
        ),
      )
    );
  }
}

