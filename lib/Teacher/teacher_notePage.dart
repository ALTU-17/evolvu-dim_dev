import 'dart:convert';
import 'package:evolvu/Teacher/teacher_DeatilCard.dart';
import 'package:evolvu/Teacher/teacher_noteCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http; // Import your model

class TeacherNotePage extends StatefulWidget {
  final String academic_yr;
  final String shortName;
  final String studentId;
  final String classId;
  final String secId;
  TeacherNotePage({ required this.studentId,required this.academic_yr,required this.shortName, required this.classId, required this.secId});

  @override
  _TeacherNotePageState createState() => _TeacherNotePageState();
}

class _TeacherNotePageState extends State<TeacherNotePage> {
  late Future<List<TeacherNote>> futureNotes;
  String reg_id = "";
  String url = "";

  Future<List<TeacherNote>> fetchTeacherNotes() async {


    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');
    String? logUrls = prefs.getString('logUrls');
    print('logUrls====\\\\\: $logUrls');
    if (logUrls != null) {
      try {
        Map<String, dynamic> logUrlsparsed = json.decode(logUrls);
        print('logUrls====\\\\\11111: $logUrls');

        // academic_yr = logUrlsparsed['academic_yr'];
        reg_id = logUrlsparsed['reg_id'];

        // print('academic_yr ID: $academic_yr');
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

        // shortName = parsedData['short_name'];
        url = parsedData['url'];

        // print('Short Name: $shortName');
        print('URL: $url');
      } catch (e) {
        print('Error parsing school info: $e');
      }
    } else {
      print('School info not found in SharedPreferences.');
    }

    final response = await http.post(Uri.parse(url+"get_teachernote_with_multiple_attachment"),
      body: {
        'class_id': widget.classId,
        'section_id': widget.secId,
        'parent_id': reg_id,
        'academic_yr': widget.academic_yr,
        'short_name': widget.shortName
      },
    );
    print('Error parsing school info: $response');

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print('Error parsing school info: $data');

      return data.map((item) => TeacherNote.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load teacher notes');
    }
  }

  @override
  void initState() {
    super.initState();
    // fetchTeacherNotes();
    futureNotes = fetchTeacherNotes();
  }

  Future<void> updateReadStatus(String notesId) async {
    String url = "";
    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');

    if (schoolInfoJson != null) {
      try {
        Map<String, dynamic> parsedData = json.decode(schoolInfoJson);
        url = parsedData['url'];
      } catch (e) {
        print('Error parsing school info: $e');
      }
    }
    DateTime parsedDate = DateTime.parse(DateTime.now().toIso8601String());
    String formattedDate = DateFormat("yyyy-MM-dd").format(parsedDate);
    final response = await http.post(
      Uri.parse(url + "note_read_log_create"),
      body: {
        'notes_id': notesId,
        'parent_id': reg_id,
        'read_date': formattedDate,
        'short_name': widget.shortName
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> note_read_log_create = json.decode(response.body);
      print('Error parsing school info note_read_log_create: $note_read_log_create');

      setState(() {
        futureNotes = fetchTeacherNotes();
      });
    } else {
      print('Failed to update read status');
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
              "Teacher Note",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: FutureBuilder<List<TeacherNote>>(
                future: futureNotes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No notes available'));
                  } else {
                    final notes = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 10.h),
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: NoteCard(
                            name: note.name,
                            date: note.date,
                            note: note.description,
                            subject: note.subjectName,
                            classname: note.className,
                            readStatus: note.read_status,
                            onTap: () {
                              // updateReadStatus(note.notesId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TeacherDetailCard(
                                    shortName: widget.shortName,
                                    academic_yr: widget.academic_yr,
                                    name: note.name,
                                    notesId: note.notesId,
                                    date: note.date,
                                    note: note.description,
                                    subject: note.subjectName,
                                    className: note.className,
                                    imageList: note.imageList,
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