import 'package:evolvu/Notice_SMS/notice_DeatilPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Teacher/Attachment.dart';

class NoticeDetailCard extends StatelessWidget {
  final String teacher;
  final String remarksubject;
  final String type;
  final String date;
  final String academic_yr;
  final String noticeID;
  final String shortName;
  final String classname;
  final String noticeDesc;
  final List<Attachment> attachment;


  const NoticeDetailCard({
    required this.teacher,
    required this.remarksubject,
    required this.type,
    required this.date,
    required this.academic_yr,
    required this.noticeID,
    required this.shortName,
    required this.classname,
    required this.noticeDesc,
    required this.attachment,

  });

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
              "Notice/SMS Details",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 6.h),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: NoticeDetailPage(
                      noticeInfo: NoticeInfo(
                          classname:classname,
                          date:date,
                        subject:remarksubject,
                        description:noticeDesc,
                        attachment:attachment,
                        noticeId:noticeID,

                      ),

                      // showAttachments: type == 'notice',
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
