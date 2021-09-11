import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileMainScreen extends StatelessWidget {
  const MobileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[100],
        title: Row(
        children: [
        Text("Yash"),
          Spacer(),
          FlatButton(onPressed: () { },
          child: Text("Contact"),),
          SizedBox(width: 20,),
          RaisedButton(onPressed: () { },
          child: Text("Resume"),)
    ]
    )),

    );
  }
}
