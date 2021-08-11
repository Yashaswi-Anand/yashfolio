import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController scrollController = ScrollController();
  final itemSize = 100.0;

  moveUP(){
    scrollController.animateTo(scrollController.offset-itemSize, duration: Duration(milliseconds: 500),
        curve: Curves.linear);
  }
  moveDown()
  {
    scrollController.animateTo(scrollController.offset+itemSize, duration: Duration(milliseconds: 500),
        curve: Curves.linear);
  }
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() { });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Yashaswi Anand")),
      ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 70,
                color: Colors.brown[100],
                child: Row(
                  children: [
                    Text("Dashboard"),
                    Spacer(),
                    FlatButton(onPressed: moveUP,child: Text("contact"),),
                    SizedBox(width: 20,),
                    RaisedButton(onPressed: moveDown,child: Text("resume"),),
                  ],
                ),
              ),
              VxDevice(mobile:  Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  itemExtent: itemSize,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("Index : $index"));
                  },
                ),
              ),
                  web: Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      itemExtent: itemSize,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text("Index : $index"));
                      },
                    ),
                  ) ),
            ],
          ),
        )
    );
  }
}