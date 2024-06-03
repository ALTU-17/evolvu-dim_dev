import 'package:evolvu/all_routs.dart';
import 'package:evolvu/const/const_teacherNoteCard.dart';
import 'package:evolvu/Homework/homeWork_DeatilPage.dart';
import 'package:evolvu/Teacher/teacher_DeatilPage.dart';
import 'package:evolvu/Teacher/teacher_noteCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWorkDetailCard extends StatelessWidget {
  const HomeWorkDetailCard({super.key});

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
                            className: '4 C',
                            subject: 'Games',
                            assignedDate: 'Games',
                            submissionDate: '4 C',
                            homework: '4 C',
                            homeworkStatus: '4 C',
                            teachersComment: '4 C',
                            attachment: '4 C',
                           
                          ),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
