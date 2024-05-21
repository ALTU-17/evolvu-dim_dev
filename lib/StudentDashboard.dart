import 'dart:convert';

import 'package:evolvu/login.dart';
import 'package:evolvu/student_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evolvu/student_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

class StudentActivityPage extends StatelessWidget {
  final String studentId;
  final String firstName;
  final String rollNo;
  final String className;
  final String classTeacher;
  final String gender;

  StudentActivityPage({
    required this.studentId,
    required this.firstName,
    required this.rollNo,
    required this.className,
    required this.classTeacher,
    required this.gender,
  });

  String shortName = "";
  // String studentId = "";
  String academic_yr = "";
  String reg_id = "";
  String url = "";

  String imageUrl="";

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
        // shortName = logUrlsparsed['short_name'];

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

        String schoolId = parsedData['school_id'];
        String name = parsedData['name'];
        shortName = parsedData['short_name'];
        url = parsedData['url'];
        String teacherApkUrl = parsedData['teacherapk_url'];
        String projectUrl = parsedData['project_url'];
        String defaultPassword = parsedData['default_password'];

        print('Short Name: $shortName');
        print('URL: $url');
        print('Teacher APK URL: $teacherApkUrl');
        print('Project URL: $projectUrl');
        print('Default Password: $defaultPassword');
      } catch (e) {
        print('Error parsing school info: $e');
      }
    } else {
      print('School info not found in SharedPreferences.');
    }

    http.Response response = await http.post(
      Uri.parse(url + "get_childs"),
      body: {
        'reg_id': reg_id,
        'academic_yr': academic_yr,
        'short_name': shortName
      },
    );

    print('child status code: ${response.statusCode}');
    print('child Response body====:>  ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> apiResponse = json.decode(response.body);

// Assuming the API response contains only one object, you can access it like this
      Map<String, dynamic> childInfo = apiResponse[0];

       // studentId = childInfo['student_id'];
    }

    http.Response get_student_profile_images_details = await http.post(
      Uri.parse(url + "get_student_profile_images_details"),
      body: {
        'student_id': studentId,
        // 'academic_yr': academic_yr,
        'short_name': shortName
      },
    );

    print('get_student_profile_images_details status code: ${get_student_profile_images_details.statusCode}');
    print('get_student_profile_images_details Response body====:>  ${get_student_profile_images_details.body}');

    if (get_student_profile_images_details.statusCode == 200) {
      // Parse the JSON response body
      Map<String, dynamic> responseData = json.decode(get_student_profile_images_details.body);

      // Extract the 'image_url' from the 'data' object
       imageUrl = responseData['image_url'];

      // Print the imageUrl
      print('Image URL: $imageUrl');

    }




  }

  @override
  Widget build(BuildContext context) {
    // Call the method to retrieve and parse school info when the widget is built
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
                            SizedBox.square(
                              dimension: 60.w,
                              child:
                              Image.asset(
                                gender == 'M' ? 'assets/boy.png' : 'assets/girl.png', // Replace with your actual image paths

                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$firstName",
                                    style: TextStyle(fontWeight: FontWeight.bold),

                                  ),
                                  Text(
                                    "RollNo: $rollNo",
                                    style: TextStyle(fontSize: 10.sp,color: Colors.red),
                                  ),
                                ],
                                //  dense: true,
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
                              child:   Column(

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Class",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "$className",
                                    style: TextStyle(fontSize: 10.sp,color: Colors.red),
                                  ),
                                ],
                                //  dense: true,
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
                                        "Teacher ",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "$classTeacher",
                                        style: TextStyle(fontSize: 10.sp,color: Colors.red),
                                      ),
                                    ],
                                    //  dense: true,
                                  ),
                                )),
                            //   ListTile(),
                            // Column(),
                            // Column(),
                          ],
                        ),
                      ),
                                        ),
                    ),
                        // SizedBox(height: 2.h),
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
                          padding: const EdgeInsets.all(23),
                          children: List.generate(1, (index) {
                            return Card(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => StudentProfilePage()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (imageUrl.isNotEmpty) // Conditionally show the image
                                      Image.network(
                                        imageUrl + '?timestamp=${DateTime.now().millisecondsSinceEpoch}', // Append a timestamp as a query parameter to force reload
                                        height: 60,
                                      )
                                    else
                                      Image.asset(
                                        gender == 'M' ? 'assets/boy.png' : 'assets/girl.png', // Replace with your actual image paths
                                        height: 60,
                                      ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Student Profile ",
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
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );

      },
    );
  }
}

StudentCardshow() {


}
