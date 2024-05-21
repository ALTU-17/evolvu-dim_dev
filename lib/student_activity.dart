// import 'package:evolvu/studentCard.dart';

import 'package:evolvu/common/gradiant_container.dart';
import 'package:evolvu/login.dart';
import 'package:evolvu/student_profile_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'all_routs.dart';
import 'common/studentCardDuplicate.dart';

class StudentActivityPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SASC EvolvU Smart Parent App(2024-2025)",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GradientContainer(),

          Positioned(
            top: 80,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StudentCard1(
                    name: 'SHIFRA',
                    rollno: 'Roll NO : 36',
                    clas: 'Class',
                    div: '5 D',
                    techer: 'Teacher',
                    techName: 'KAVITA RAVIKUMAR \n     DESHPANDE', img: 'assets/girl.png',  onTap: () {

                       Navigator.of(context).pushNamed(studentActivityPage);

                          },
                         showAttendanceLabel: false,
                  ),


                  SizedBox(height: 2.h),
                  Text(
                    "Student Activity",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.3,
                    mainAxisSpacing: 1.2,
                    padding: const EdgeInsets.all(23),
                    children: List.generate(1, (index) {
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (_) => StudentProfilePage()),
                            // );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                height: 70.h,
                                'assets/girl.png',
                              ),
                              Text(
                                "Student Profile ",
                                style: TextStyle(color: Colors.black, fontSize: 14.sp,),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.dashboard),
      //       label: 'Dashboard',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today),
      //       label: 'Calendar',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
