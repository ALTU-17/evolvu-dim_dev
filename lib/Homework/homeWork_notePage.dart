import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evolvu/Homework/homeWork_noteCard.dart';

class HomeWorkNotePage extends StatelessWidget {
  HomeWorkNotePage({super.key});

  final List<Map<String, String>> notes = [
    {
      'subject': 'CCA',
      'assignedDate': '29-05-2024',
      'submissionDate': '30-05-2024',
      'status': 'Assigned',
    },
    {
      'subject': 'Maths',
      'assignedDate': '07-02-2024',
      'submissionDate': '10-02-2024',
      'status': 'Assigned',
    },
    // Add more notes if needed
  ];

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
              "Student HomeWork",
              style: TextStyle(
                fontSize: 20.sp, // Adjusted for better visibility
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: HomeWorkNoteCard(
                      subject: note['subject']!,
                      assignedDate: note['assignedDate']!,
                      submissionDate: note['submissionDate']!,
                      status: note['status']!,
                    ),
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
