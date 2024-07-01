import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

import '../DownloadHelper.dart';
import 'Attachment.dart';

class TeacherDetailCard extends StatelessWidget {
  final String name;
  final String notesId;
  final String date;
  final String note;
  final String subject;
  final String className;
  final List<Attachment> imageList;

  const TeacherDetailCard({
    Key? key,
    required this.name,
    required this.date,
    required this.note,
    required this.subject,
    required this.className,
    required this.imageList,
    required this.notesId,
  }) : super(key: key);

  Future<String?> _getProjectUrl() async {
    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');
    if (schoolInfoJson != null) {
      try {
        Map<String, dynamic> parsedData = json.decode(schoolInfoJson);
        String projectUrl = parsedData['project_url'];
        return projectUrl;
      } catch (e) {
        print('Error parsing school info: $e');
        return null;
      }
    } else {
      print('School info not found in SharedPreferences.');
      return null;
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
          "SASC EvolvU Smart Parent App(2024-2025)",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, true); // Pass a result back to the previous screen
          },
        ),
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
              "Teacher Note Details",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: $name',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Class: $className',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Subject: $subject',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Date: $date',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Note: $note',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        if (imageList.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Attachments:',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...imageList.map((attachment) {
                                return ListTile(
                                  leading: Icon(Icons.file_download),
                                  title: Text(attachment.imageName, style: TextStyle(fontSize: 14.sp)),
                                  subtitle: Text('${(attachment.fileSize / 1024).toStringAsFixed(2)} KB'),
                                  onTap: () async {
                                    DateTime now = DateTime.now();
                                    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

                                    String? projectUrl = await _getProjectUrl();
                                    if (projectUrl != null) {
                                      try {
                                        String downloadUrl = '$projectUrl/uploads/daily_notes/$formattedDate/$notesId/${attachment.imageName}';
                                        await downloadImage(downloadUrl, attachment.imageName);
                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        //   SnackBar(
                                        //     content: Text('File downloaded successfully.'),
                                        //   ),
                                        // );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Failed to download file: $e'),
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Failed to retrieve project URL.'),
                                        ),
                                      );
                                    }
                                  },
                                );
                              }).toList(),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<bool> _permissionRequest() async {
    PermissionStatus result;
    result = await Permission.storage.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
