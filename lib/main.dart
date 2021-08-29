import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yashfolio/Screens/HomeSereen.dart';
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
      home: MyResponce(),
    );
  }
}

class MyResponce extends StatelessWidget {
  const MyResponce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  MediaQuery.of(context).size.width < 300
          ? Container(color:Colors.brown[100],
            child: Center(child: Text("Mobile  View",
             style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold,),)),)
          :Container(
        child: ScreenTypeLayout(
            mobile: Container(color:Colors.blue[100],
              child: Center(child: Text("Mobile  View",
              style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold,),)),),
            tablet: Container(color: Colors.yellow[100],
              child: Center(child: Text("Tablet  View",
                style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold,),)),),
            desktop: Container(color: Colors.red[100],
              child: Center(child: Text("Desktop  View",
                style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold,),)),),
            watch: Container(color: Colors.purple[100]),
      ),
      ),
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
              FlatButton(
                onPressed: () { print(MediaQuery.of(context).size.width); },
                child: Text("screen size"),
              )
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
            FlatButton(
              onPressed: () { print(MediaQuery.of(context).size.width); },
              child: Text("screen size"),
            )
          ],
      ),
        ),
      )
    );
  }
}

