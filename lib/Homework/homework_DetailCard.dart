import 'package:evolvu/const/const_teacherNoteCard.dart';
import 'package:evolvu/Homework/homeWork_DeatilPage.dart';
import 'package:evolvu/Teacher/teacher_DeatilPage.dart';
import 'package:evolvu/Teacher/teacher_noteCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Teacher/Attachment.dart';

class HomeWorkDetailCard extends StatelessWidget {
  final String subject;
  final String assignedDate;
  final String submissionDate;
  final String status;
  final String homeworkId;
  final String parentComment;
  final String className;
  final String description;
  final String studentId;
  final String comment_id;
  final String Tcomment;
  final String publishDate;
  final String academic_yr;
  final String shortName;
  final List<Attachment> imageList;


  const HomeWorkDetailCard({
    Key? key,
    required this.subject,
    required this.shortName,
    required this.academic_yr,
    required this.assignedDate,
    required this.submissionDate,
    required this.status,
    required this.homeworkId,
    required this.parentComment,
    required this.className,
    required this.description,
    required this.imageList,
    required this.studentId,
    required this.comment_id,
    required this.publishDate,
    required this.Tcomment,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50.h,
        title: Text(
          "$shortName EvolvU Smart Parent App($academic_yr)",
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
              "HomeWork Details",
              style: TextStyle(
                fontSize: 20.sp, // Adjusted for better visibility
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
           // SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Center(
                        child: HomeWorkDetailPage(
                          homeworkInfo: HomeworkInfo(
                            className: className,
                            subject: subject,
                            assignedDate: assignedDate,
                            submissionDate: submissionDate,
                            homework: description,
                            homeworkStatus: status,
                            teachersComment: Tcomment,
                            attachments:imageList,
                            homeworkId:homeworkId,
                            studentId:studentId,
                            comment_id:comment_id,
                            publishDate:publishDate,
                            parentComment:parentComment,

                          ),

                        ),

                      )

                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
