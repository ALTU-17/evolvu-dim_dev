import 'package:evolvu/calender_Page.dart';
import 'package:evolvu/common/drawerAppBar.dart';
import 'package:evolvu/parentProfile_Page.dart';
import 'package:evolvu/Student/student_card.dart';
import 'package:evolvu/username_page.dart';
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

  @override
  Widget build(BuildContext context) {

    final pages = [
      StudentCard(
        onTap: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      const CalenderPage(),
      ParentProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
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
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return CustomPopup();
            //   },
            // );
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
    return Container(
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
                    color: pageIndex == 0
                        ? Color.fromARGB(255, 236, 108, 99)
                        : Colors.white,
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
                    color: pageIndex == 1
                        ? Color.fromARGB(255, 236, 108, 99)
                        : Colors.white,
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
                    color: pageIndex == 2
                        ? Color.fromARGB(255, 236, 108, 99)
                        : Colors.white,
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

class CardItem {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  CardItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });
}

class CustomPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CardItem> cardItems = [
      CardItem(
        imagePath: 'assets/logout.png',
        title: 'LogOut',
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => UserNamePage()),
          );
        },
      ),

      // Add more CardItems here...
    ];

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.only(top: 65, bottom: 0, left: 0, right: 0),
      child: Stack(
        clipBehavior: Clip.none,
        // This allows the Positioned widget to go outside the Stack's bounds
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 241, 241),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: cardItems.map((cardItem) {
                  return InkWell(
                    onTap: cardItem.onTap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(cardItem.imagePath, width: 40, height: 40),
                        SizedBox(height: 8),
                        Text(
                          cardItem.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Positioned(
            top: -50, // Adjust this value to place the button above the dialog
            right: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Colors.black, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
