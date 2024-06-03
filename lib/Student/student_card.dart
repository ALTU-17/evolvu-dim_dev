import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

import '../common/rotatedDivider_Card.dart';
import 'StudentDashboard.dart';

class StudentCard extends StatefulWidget {
  final Function(int index) onTap;
  const StudentCard({super.key, required this.onTap});
  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {

  List<Map<String, dynamic>> students = [];
  String shortName = "";
  String url = "";
  String academicYr = "";
  String regId = "";

  Future<void> _getSchoolInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');
    String? logUrls = prefs.getString('logUrls');

    if (logUrls != null) {
      try {
        Map<String, dynamic> logUrlsparsed = json.decode(logUrls);
        academicYr = logUrlsparsed['academic_yr'];
        regId = logUrlsparsed['reg_id'];
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
      Uri.parse("${url}get_childs"),
      body: {
        'reg_id': regId,
        'academic_yr': academicYr,
        'short_name': shortName,
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
          Positioned.fill(
            child: Image.asset(
              'assets/img.png', // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
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
                classId: students[index]['class_id'], // Pass the student_id
                secId: students[index]['section_id'], // Pass the student_id
                shortName: shortName,
                url: url,
                academicYr: academicYr,
              );
            },
          ),
        ],
      ),
    );
  }
}
class MyData {
  final String id;
  // final String email;
  // Add other properties as needed

  MyData({required this.id});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      id: json['_id'],
      // email: json['email'],
      // Map other properties here
    );
  }
}
class StudentCardItem extends StatefulWidget {
  final String firstName;
  final String rollNo;
  final String className;
  final String classTeacher;
  final String gender;
  final String studentId;
  final String shortName;
  final String url;
  final String academicYr;
  final String classId;
  final String secId;

  StudentCardItem({
    required this.firstName,
    required this.rollNo,
    required this.className,
    required this.classTeacher,
    required this.gender,
    required this.studentId,
    required this.shortName,
    required this.url,
    required this.academicYr,
    required this.classId,
    required this.secId,
  });

  @override
  _StudentCardItemState createState() => _StudentCardItemState();
}

class _StudentCardItemState extends State<StudentCardItem> {
  String attendance = "Loading...";

  @override
  void initState() {
    super.initState();
    _fetchAttendance();
  }

  Future<void> _fetchAttendance() async {
    http.Response response = await http.post(
      Uri.parse(widget.url + "get_student_attendance_percentage"),
      body: {
        'student_id': widget.studentId,
        'acd_yr': widget.academicYr,
        'short_name': widget.shortName,
      },
    );

    print('Response percentage: ${response.body}');

    if (response.statusCode == 200) {
       String apiValue = response.body; // Adjust this line based on your actual API response

      // final Map<String, dynamic> data = json.decode(response.body);
      // final myData = MyData.fromJson(apiValue);
      print('ID: $apiValue');
      setState(() {
        attendance =apiValue;
      });
    } else {
      setState(() {
        attendance = "N/A";
      });
      print('Failed to load attendance');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var x = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentActivityPage(
              studentId: widget.studentId,
              firstName: widget.firstName,
              rollNo: widget.rollNo,
              className: widget.className,
              classTeacher: widget.classTeacher,
              gender: widget.gender,
              classId: widget.classId,
              secId: widget.secId,
            ),
          ),
        );
        // if (x==null) return;
        // onTap (x as int);

      },
      child: SizedBox(
        height: 110.h,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 3, 8, 0),
          child: Card(
            child: Row(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 60.w,
                        child: Image.asset(
                          widget.gender == 'F' ? 'assets/girl.png' : 'assets/boy.png', // Replace with your actual image paths
                        ),
                      ),
                      attendance != null
                          ? Padding(
                        padding: EdgeInsets.fromLTRB(3, 3, 0, 0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Attendance ',
                            style: TextStyle(fontSize: 10.sp, color: Colors.black), // Default style
                            children: <TextSpan>[
                              TextSpan(
                                text: '$attendance%',
                                style: TextStyle(color: Colors.blue), // Change the color here
                              ),
                            ],
                          ),
                        )
                      )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.firstName,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),
                        ),
                        Text(
                          "RollNo: ${widget.rollNo}",
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
                        widget.className,
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
                          widget.classTeacher,
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
