import 'package:evolvu/calender_Page.dart';
import 'package:evolvu/childDashboad.dart';
import 'package:evolvu/common/drawerAppBar.dart';
import 'package:evolvu/parentProfile_Page.dart';
import 'package:evolvu/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ParentDashBoardPage extends StatefulWidget {
  const ParentDashBoardPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ParentDashBoardPageState createState() => _ParentDashBoardPageState();
}

class _ParentDashBoardPageState extends State<ParentDashBoardPage> {
  int pageIndex = 0;

  final pages = [
    StudentCard(),
    const CalenderPage(),
    const ParentProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar:
       AppBar(
        title: Text(
          "SASC EvolvU Smart Parent App(2024-2025)",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        elevation: 0,
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            child: Icon(Icons.menu, color: Colors.red),
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Page content
          pages[pageIndex],
        ],
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return
    Container(
  height: 75.h,
  decoration: const BoxDecoration(
    //color: Color.fromARGB(66, 165, 152, 152),
  ),
  child: SingleChildScrollView(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
         // mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              enableFeedback: true,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: Icon(
                Icons.dashboard,
                color: pageIndex == 0 ?  Color.fromARGB(255, 236, 108, 99) : Colors.white,
                size: 30,
              ),

            ),
            Text('Dashboard', style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: Icon(
                Icons.calendar_month,
                color: pageIndex == 1 ? Color.fromARGB(255, 236, 108, 99) : Colors.white,
                size: 30,
              ),
            ),
            Text('Evants', style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: Icon(
               Icons.person,
                color: pageIndex == 2 ? Color.fromARGB(255, 236, 108, 99) : Colors.white,
                size: 30,
              ),
            ),
            Text('Profile', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    ),
  ),
);

  }
}


