import 'dart:convert';
import 'package:evolvu/Homework/homeWork_notePage.dart';
import 'package:evolvu/Remark/remark_notePage.dart';
import 'package:evolvu/login.dart';
import 'package:evolvu/Student/student_profile_page.dart';
import 'package:evolvu/Teacher/teacher_notePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evolvu/Student/student_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import '../Notice_SMS/notice_notePage.dart';

class CardItem {
  final String? imageUrl;
  final String imagePath;
  final String title;
  final Function(BuildContext context) onTap;

  CardItem({
    this.imageUrl,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });
}

class StudentActivityPage extends StatelessWidget {
  final String studentId;
  final String firstName;
  final String rollNo;
  final String className;
  final String classTeacher;
  final String gender;
  final String classId;
  final String secId;

  StudentActivityPage({
    required this.studentId,
    required this.firstName,
    required this.rollNo,
    required this.className,
    required this.classTeacher,
    required this.gender,
    required this.classId,
    required this.secId,
  });

  String shortName = "";
  String academic_yr = "";
  String reg_id = "";
  String url = "";
  String imageUrl = "";

  Future<void> _getSchoolInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');
    String? logUrls = prefs.getString('logUrls');
    print('logUrls====\\\\\: $logUrls');
    if (logUrls != null) {
      try {
        Map<String, dynamic> logUrlsparsed = json.decode(logUrls);
        print('logUrls====\\\\\11111: $logUrls');

        academic_yr = logUrlsparsed['academic_yr'];
        reg_id = logUrlsparsed['reg_id'];

        print('academic_yr ID: $academic_yr');
        print('reg_id: $reg_id');
      } catch (e) {
        print('Error parsing school info: $e');
      }
    } else {
      print('School info not found in SharedPreferences.');
    }

    if (schoolInfoJson != null) {
      try {
        Map<String, dynamic> parsedData = json.decode(schoolInfoJson);

        shortName = parsedData['short_name'];
        url = parsedData['url'];

        print('Short Name: $shortName');
        print('URL: $url');
      } catch (e) {
        print('Error parsing school info: $e');
      }
    } else {
      print('School info not found in SharedPreferences.');
    }

    http.Response response = await http.post(
      Uri.parse(url + "get_student"),
      body: {
        'student_id': studentId,
        'academic_yr': academic_yr,
        'short_name': shortName
      },
    );

    print('child status code: ${response.statusCode}');
    print('child Response body====:>  ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> apiResponse = json.decode(response.body);
      Map<String, dynamic> childInfo = apiResponse[0];
    }

    http.Response get_student_profile_images_details = await http.post(
      Uri.parse(url + "get_student_profile_images_details"),
      body: {
        'student_id': studentId,
        'short_name': shortName
      },
    );

    print('get_student_profile_images_details status code: ${get_student_profile_images_details.statusCode}');
    print('get_student_profile_images_details Response body====:>  ${get_student_profile_images_details.body}');

    if (get_student_profile_images_details.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(get_student_profile_images_details.body);
      imageUrl = responseData['image_url'];
      print('Image URL: $imageUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<CardItem> cardItems = [
      CardItem(
        imagePath: gender == 'F' ? 'assets/girl.png' : 'assets/boy.png', // Local fallback image
        title: 'Student Profile',
        onTap: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentProfilePage(studentId: studentId,shortName: shortName,academic_yr: academic_yr
                ,),
            ),
          );
        },
      ),
      CardItem(
        imagePath: 'assets/teacher.png',
        title: 'Teacher Note',
        onTap: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeacherNotePage(studentId: studentId,shortName: shortName,academic_yr: academic_yr
                  ,classId: classId,secId:secId),
            ),
          );
          },
      ),
      CardItem(
        imagePath: 'assets/books.png',
        title: 'Homework',
        onTap: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeWorkNotePage(studentId: studentId,shortName: shortName,academic_yr: academic_yr
                  ,classId: classId,secId:secId),
            ),
          );
          },
      ),
      CardItem(
        imagePath: 'assets/studying.png',
        title: 'Remark',
        onTap: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RemarkNotePage(studentId: studentId,shortName: shortName,academic_yr: academic_yr
                  ,classId: classId,secId:secId),
            ),
          );
          },
      ),
      CardItem(
        imagePath: 'assets/notice.png',
        title: 'Notice/SMS',
        onTap: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoticeNotePage(studentId: studentId,shortName: shortName,academic_yr: academic_yr
                  ,classId: classId,secId:secId),
            ),
          );
          },
      ),
      // CardItem(
      //   imagePath: 'assets/new_module.png', // Path to the new module image
      //   title: 'New Module',
      //   onTap: (context) {
      //     Navigator.pushNamed(context, '/newModulePage'); // New module page route
      //   },
      // ),
    ];

    return FutureBuilder(
      future: _getSchoolInfo(),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              "$shortName EvolvU Smart Parent App $academic_yr",
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
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
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 120.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: SizedBox.square(
                                    dimension: 60.w,
                                    child: imageUrl.isNotEmpty
                                        ? Image.network(
                                      imageUrl + '?timestamp=${DateTime.now().millisecondsSinceEpoch}',
                                      height: 60,
                                    )
                                        : Image.asset(
                                      gender == 'F' ? 'assets/girl.png' : 'assets/boy.png', // Local fallback image
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$firstName",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "RollNo: $rollNo",
                                        style: TextStyle(fontSize: 10.sp, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                Transform.rotate(
                                  child: Container(
                                    width: 2.w,
                                    height: 70.h,
                                    color: Color.fromARGB(255, 175, 167, 167),
                                  ),
                                  angle: -math.pi / 180.0,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Class",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "$className",
                                        style: TextStyle(fontSize: 10.sp, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                Transform.rotate(
                                  child: Container(
                                    width: 2.w,
                                    height: 70.h,
                                    color: Color.fromARGB(255, 175, 167, 167),
                                  ),
                                  angle: -math.pi / 180.0,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Teacher",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "$classTeacher",
                                          style: TextStyle(fontSize: 10.sp, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 1.2,
                        padding: const EdgeInsets.only(top: 10,left: 20,right: 30),
                        children: List.generate(cardItems.length, (index) {
                          final item = cardItems[index];
                          return Card(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () => item.onTap(context),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    item.imagePath,
                                    height: 60,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                    ),
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
          bottomNavigationBar: buildMyNavBar(context),
        );
      },


    );
  }
}
Container buildMyNavBar(BuildContext context) {
  return Container(
      height: 80.h,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                enableFeedback: true,
                onPressed: () {
                  Navigator.of(context).pop(0);
                },
                icon: const Icon(
                  Icons.dashboard,
                  color: Colors.white,

                  size: 30,
                ),
              ),
              Text('Dashboard', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  Navigator.of(context).pop(1);

                },
                icon: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,

                  size: 30,
                ),
              ),
              const Text('Calendar', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  Navigator.of(context).pop(2);

                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,

                  size: 30,
                ),
              ),
              Text('Profile', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
      );
      }