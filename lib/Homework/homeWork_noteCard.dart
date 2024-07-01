import 'package:evolvu/Homework/homework_DetailCard.dart';
import 'package:evolvu/Teacher/Attachment.dart';
import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:evolvu/all_routs.dart';

import 'homeWork_notePage.dart';



class Homework {
  final String homeworkId;
  final String description;
  final String teacherId;
  final String sectionId;
  final String smId;
  final String classId;
  final String endDate;
  final String startDate;
  final String publishDate;
  final String academicYr;
  final String publish;
  final String commentId;
  final String studentId;
  final String parentId;
  final String homeworkStatus;
  final String comment;
  final String parentComment;
  final String className;
  // final String division;
  final String subjectName;
  final String homeworkRLogId;
  final String readStatus;
  final List<Attachment> imageList;

  Homework({
    required this.homeworkId,
    required this.description,
    required this.teacherId,
    required this.sectionId,
    required this.smId,
    required this.classId,
    required this.endDate,
    required this.startDate,
    required this.publishDate,
    required this.academicYr,
    required this.publish,
    required this.commentId,
    required this.studentId,
    required this.parentId,
    required this.homeworkStatus,
    required this.comment,
    required this.parentComment,
    required this.className,
    // required this.division,
    required this.subjectName,
    required this.homeworkRLogId,
    required this.readStatus,
    required this.imageList,
  });

  factory Homework.fromJson(Map<String, dynamic> json) {
    return Homework(
      homeworkId: json['homework_id'],
      description: json['description'],
      teacherId: json['teacher_id'],
      sectionId: json['section_id'],
      smId: json['sm_id'],
      classId: json['class_id'],
      endDate: json['end_date'],
      startDate: json['start_date'],
      publishDate: json['publish_date'],
      academicYr: json['academic_yr'],
      publish: json['publish'],
      commentId: json['comment_id'],
      studentId: json['student_id'],
      parentId: json['parent_id'],
      homeworkStatus: json['homework_status'],
      comment: json['comment'],
      parentComment: json['parent_comment'],
      className: json['class_name']+json['division'],
      // division: json['division'],
      subjectName: json['subject_name'],
      homeworkRLogId: json['homework_r_log_id'],
      readStatus: json['read_status'],
      imageList: (json['image_list'] as List)
          .map((item) => Attachment.fromJson(item))
          .toList(),
    );
  }
}

class HomeWorkNoteCard extends StatelessWidget {
  final String subject;
  final String assignedDate;
  final String submissionDate;
  final String status;
  final VoidCallback onTap;

  const HomeWorkNoteCard({
    Key? key,
    required this.subject,
    required this.assignedDate,
    required this.submissionDate,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => HomeWorkDetailCard(),
      //     ),
      //   );
      //   // Navigator.of(context).pushNamed(homeWorkDetailCard);
      // },
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/books.png',
                    height: 60,
                  ),
                  SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Subject:  ',
                                // style: Commonstyle.lableBold,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            TextSpan(
                              text: subject,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Assigned Date: ',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                               // style: Commonstyle.lableBold,
                            ),
                            TextSpan(
                              text: assignedDate,

                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Submission Date: ',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: submissionDate,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Status: ',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: status,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
