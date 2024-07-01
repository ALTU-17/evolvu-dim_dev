import 'package:evolvu/Remark/remark_DeatilCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'remark_noteCard.dart'; // Update the import path accordingly

class RemarkNotePage extends StatefulWidget {
  final String studentId;
  final String academic_yr;
  final String shortName;
  final String classId;
  final String secId;
  RemarkNotePage({required this.studentId, required this.academic_yr, required this.shortName, required this.classId, required this.secId});

  @override
  _RemarkNotePage createState() => _RemarkNotePage();
}

class _RemarkNotePage extends State<RemarkNotePage> {
  late Future<List<Remark>> futureRemarks;
  String shortName = "";
  String academic_yr = "";
  String reg_id = "";
  String url = "";

  @override
  void initState() {
    super.initState();
    futureRemarks = fetchRemarks();
  }

  Future<List<Remark>> fetchRemarks() async {
    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');
    String? logUrls = prefs.getString('logUrls');

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

    final response = await http.post(
      Uri.parse(url + 'get_premarks'),
      body: {
        'student_id': widget.studentId,
        'parent_id': reg_id,
        'academic_yr': academic_yr,
        'short_name': shortName,
      },
    );

    if (response.statusCode == 200) {
      print('Response Remarkkkkk++++: ${response.body}');

      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((remark) => Remark.fromJson(remark)).toList();
    } else {
      throw Exception('Failed to load remarks${response}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50.h,
        title: Text(
          "${widget.shortName} EvolvU Smart Parent App(${widget.academic_yr})",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Text(
              "Student Remarks",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: FutureBuilder<List<Remark>>(
                future: futureRemarks,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No remarks assigned'));
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 10.h),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final remark = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: RemarkNoteCard(
                            date: remark.remarkDate,
                            teacher: remark.teacherName,
                            remarksubject: remark.remarkSubject,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RemarkDetailCard(
                                    shortName: shortName,
                                    academic_yr: academic_yr,
                                    remarksubject: remark.remarkSubject,
                                    imageList: remark.imageList,
                                    description: remark.remarkDesc,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
