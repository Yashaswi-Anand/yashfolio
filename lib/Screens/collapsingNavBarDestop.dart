import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yashfolio/defaultScreen/defaultScreens.dart';

class CollapsingNavbarDestop extends StatefulWidget {
  @override
  _CollapsingNavbarDestopState createState() => _CollapsingNavbarDestopState();
}

class _CollapsingNavbarDestopState extends State<CollapsingNavbarDestop> with SingleTickerProviderStateMixin{

  double yOffset = 0;
  double xOffset = 60;
  double pageScale = 1;
  int selectedMenuItem = 0;
  bool sidebarOpen = false;



  void setSidebarState() {
    setState(() {
      xOffset = sidebarOpen ? 265 : 60;
      //yOffset = sidebarOpen ? 70 :0;
      //pageScale = sidebarOpen ? 0.8 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
     body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              color: Colors.brown[400],
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [

                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            new Container(
                                margin: const EdgeInsets.all(5),
                                width: 52.0,
                                height: 45.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                            "https://i.imgur.com/BoN9kdC.png")
                                    )
                                )),
                            Container(
                              child: Expanded(
                                child: SizedBox(child: Text("Yash",style: TextStyle(fontSize: 20,color: Colors.white),),
                              ),
                            ),),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Container(
                    child: Expanded(
                        child: new ListView.builder(
                          itemCount: menuItems.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              sidebarOpen = false;
                              selectedMenuItem = index;
                              setSidebarState();

                            },
                            child: MenuItem(
                              itemName: menuItems[index].menuName,
                              itemIcon: menuItems[index].menuIcon,
                              page: menuItems[index].page,
                              selected: selectedMenuItem,
                              position: index,
                            ),
                          ),
                        )),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        if(sidebarOpen == true){
                          sidebarOpen = false;
                          setSidebarState();
                        }else{
                          sidebarOpen = true;
                          setSidebarState();
                        }
                        sidebarOpen = false;
                        setSidebarState();
                        //setSidebarTitle();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 200),
                            padding: const EdgeInsets.all(20),
                            child: Expanded(
                              child: Icon(Icons.arrow_back, color: Colors.black87,),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(xOffset, yOffset, 1.0)
                  ..scale(pageScale),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: sidebarOpen
                        ? BorderRadius.circular(10)
                        : BorderRadius.circular(5)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // change size bar state
                                    sidebarOpen = !sidebarOpen;
                                    setSidebarState();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Icon(Icons.menu),
                                  ),
                                ),
                                Container(
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(menuItems[selectedMenuItem].menuName, cursor: " ",
                                        speed: Duration(milliseconds: 150),
                                        textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown[900]),),
                                    ],
                                    isRepeatingAnimation: true,
                                    repeatForever: true,
                                    displayFullTextOnTap: true,
                                    stopPauseOnTap: false,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: height,
                                color: Colors.blueGrey,
                                child: Center(
                                  child:  menuItems[selectedMenuItem].page,
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final String itemName;
  final int selected;
  final int position;
  final IconData itemIcon;
  final Widget page;

  MenuItem({required this.itemName, required this.position, required this.selected, required this.itemIcon, required this.page});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.selected == widget.position ? Colors.blue[100] : Colors.brown[400],

      child: Row(
        children: [
          Container(

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              padding: EdgeInsets.all(isHovering ? 18 : 15),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      widget.itemIcon,
                      color: isHovering ? Colors.lightGreenAccent : Colors.white,
                    ),
                    SizedBox(width: 7,),
                    Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          widget.itemName,
                          style: TextStyle(color: isHovering ? Colors.lightGreenAccent : Colors.white,
                              fontWeight: FontWeight.bold),
                        )),

                  ],
                ),
              ),
            ),
          ),
          /*Container(
            child: Icon(
              widget.itemIcon,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
          ),
          Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.itemName,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),*/
        ],
      ),
    );
  }


}

// models

class MenuItems {
  final String menuName;
  final IconData menuIcon;
  final Widget page;

  const MenuItems({
    required this.menuName,
    required this.menuIcon,
    required this.page,
  });
}

List<MenuItems> menuItems = [
  MenuItems(
    menuName: 'About Me',
    menuIcon: Icons.person,
    page: HomeScreen(),
  ),
  MenuItems(
    menuName: 'Educational Details',
    menuIcon: Icons.menu_book_sharp,
    page: HomeScreen(),
  ),
  MenuItems(
    menuName: 'Projects',
    menuIcon: Icons.pages_sharp,
    page: HomeScreen(),
  ),
  MenuItems(
    menuName: 'Internship',
    menuIcon: Icons.notifications,
    page: HomeScreen(),
  ),
  MenuItems(
    menuName: 'Skills',
    menuIcon: Icons.masks,
    page: HomeScreen(),
  ),
  MenuItems(
      menuName: 'Certificates',
      menuIcon: Icons.sports_basketball_rounded,
      page: HomeScreen()),
];
