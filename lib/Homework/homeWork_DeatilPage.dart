import 'package:evolvu/all_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeworkInfo {
  final String className;
  final String subject;
  final String assignedDate;
  final String submissionDate;
  final String homework;
  final String homeworkStatus;
  final String teachersComment;
  final String attachment;
 

  HomeworkInfo({
    required this.className,
    required this.subject,
    required this.assignedDate,
    required this.submissionDate,
    required this.homework,
    required this.homeworkStatus,
    required this.teachersComment,
    required this.attachment,
    
  });
}

class HomeWorkDetailPage extends StatelessWidget {
  final HomeworkInfo homeworkInfo;

  HomeWorkDetailPage({required this.homeworkInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 720.h,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // spreadRadius: 3,
            blurRadius: 5,
            //offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Class                             ${homeworkInfo.className}',
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
         SizedBox(height: 8.h),
          Text(
            'Subject                         ${homeworkInfo.subject}',
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'AssignedDate:             ${homeworkInfo.assignedDate}',
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
         SizedBox(height: 8.h),
          Text(
            'SubmissionDate:         ${homeworkInfo.submissionDate}',
             style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Homework:                  ${homeworkInfo.homework}',
             style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
         SizedBox(height: 8.h),
          Text(
            'HomeworkStatus:       ${homeworkInfo.homeworkStatus}',
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'TeachersComment:    ${homeworkInfo.teachersComment}',
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          Row(
            children: [
              Text(
                'Attachment   : ${homeworkInfo.attachment}',
                style:  TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              const Spacer(),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  // Add your action here
                },
                icon: const Icon(
                  Icons.download,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
             'Parent\'s Comment:',
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
           SizedBox(height: 10.h),
          Container(
            height: 120.h,
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 238, 238),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type here...',
              ),
              maxLines: null,
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/parentDashBoardPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 6),
              ),
              child:  Text(
                'Update',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
