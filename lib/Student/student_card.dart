import 'dart:convert';
import 'package:evolvu/all_routs.dart';
import 'package:evolvu/Student/student_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

import '../common/rotatedDivider_Card.dart';
import 'StudentDashboard.dart';

class StudentCard extends StatefulWidget {
  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  String attendance ="90%";
  List<Map<String, dynamic>> students = [];

  Future<void> _getSchoolInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');
    String? logUrls = prefs.getString('logUrls');

    String academic_yr = "";
    String reg_id = "";
    String shortName = "";
    String url = "";

    if (logUrls != null) {
      try {
        Map<String, dynamic> logUrlsparsed = json.decode(logUrls);
        academic_yr = logUrlsparsed['academic_yr'];
        reg_id = logUrlsparsed['reg_id'];
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
    print('Response get_childs: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> apiResponse = json.decode(response.body);
      setState(() {
        students = List<Map<String, dynamic>>.from(apiResponse);
      });
    } else {
      print('Failed to load students');
    }


    http.Response percentage_response = await http.post(
      Uri.parse(url + "get_student_attendance_percentage"),
      body: {
        'student_id': reg_id,
        'academic_yr': academic_yr,
        'short_name': shortName
      },
    );

    print('Response percentage: ${percentage_response.body}');

    if (percentage_response.statusCode == 200) {
      // List<dynamic> apiResponse = json.decode(response.body);
      // setState(() {
      //   students = List<Map<String, dynamic>>.from(apiResponse);
      // });
    } else {
      print('Failed to load students');
    }

  }

  @override
  void initState() {
    super.initState();
    _getSchoolInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('My Child'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/img.png', // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
          // Overlay to darken the background image for better readability

          // Main content
          students.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return StudentCardItem(
                firstName: students[index]['first_name'],
                rollNo: students[index]['roll_no'],
                className: students[index]['class_name'] + students[index]['section_name'],
                classTeacher: students[index]['class_teacher'],
                gender: students[index]['gender'],
                studentId: students[index]['student_id'], // Pass the student_id
                // attendance: students[index]['attendance'],
              );
            },
          ),
        ],
      ),
    );
  }
}

class StudentCardItem extends StatelessWidget {
  final String firstName;
  final String rollNo;
  final String className;
  final String classTeacher;
  final String gender;
  final String studentId; // Add this field

  StudentCardItem({
    required this.firstName,
    required this.rollNo,
    required this.className,
    required this.classTeacher,
    required this.gender,
    required this.studentId, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    String attendance="90%";
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentActivityPage(
                studentId: studentId,
                firstName: firstName,
                rollNo: rollNo,
                className: className,
                classTeacher: classTeacher,
                gender: gender,),
            ),
          );
        },
    child:  SizedBox(
      height: 125.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Row(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox.square(
                      dimension: 70.w,
                      child: Image.asset(
                        gender == 'M' ? 'assets/boy.png' : 'assets/girl.png', // Replace with your actual image paths
                      ),
                    ),
                    attendance != null?
                    Padding(
                      padding: EdgeInsets.fromLTRB(3, 3, 0, 0),
                      child: Text("Attendance ${attendance?? ""}" , style: TextStyle(fontSize: 10.sp),),
                    ): SizedBox.shrink()
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        firstName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "RollNo: $rollNo",
                        style: TextStyle(fontSize: 10.sp, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.rotate(
                angle: -math.pi / 180.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 2.w,
                    height: 70.h,
                    color: Color.fromARGB(255, 175, 167, 167),
                  ),
                ),
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
                      className,
                      style: TextStyle(fontSize: 10.sp, color: Colors.red),
                    ),
                  ],
                ),
              ),
              const RotatedDivider(),

              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Teacher",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        classTeacher,
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
    );
  }
}
