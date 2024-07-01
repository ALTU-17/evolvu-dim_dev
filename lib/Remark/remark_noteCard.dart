import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:evolvu/all_routs.dart';
import 'package:flutter/widgets.dart';

import '../Teacher/Attachment.dart';

class Remark {
  final String remarkId;
  final String remarkDesc;
  final String remarkSubject;
  final String remarkType;
  final String remarkDate;
  final String publishDate;
  final String classId;
  final String sectionId;
  final String studentId;
  final String subjectId;
  final String teacherId;
  final String academicYr;
  final String publish;
  final String acknowledge;
  final String isDelete;
  final String teacherName;
  final String remarkRLogId;
  final String readStatus;
  final List<Attachment> imageList;

  Remark({
    required this.remarkId,
    required this.remarkDesc,
    required this.remarkSubject,
    required this.remarkType,
    required this.remarkDate,
    required this.publishDate,
    required this.classId,
    required this.sectionId,
    required this.studentId,
    required this.subjectId,
    required this.teacherId,
    required this.academicYr,
    required this.publish,
    required this.acknowledge,
    required this.isDelete,
    required this.teacherName,
    required this.remarkRLogId,
    required this.readStatus,
    required this.imageList,
  });

  factory Remark.fromJson(Map<String, dynamic> json) {
    return Remark(
      remarkId: json['remark_id'],
      remarkDesc: json['remark_desc'],
      remarkSubject: json['remark_subject'],
      remarkType: json['remark_type'],
      remarkDate: json['remark_date'],
      publishDate: json['publish_date'],
      classId: json['class_id'],
      sectionId: json['section_id'],
      studentId: json['student_id'],
      subjectId: json['subject_id'],
      teacherId: json['teacher_id'],
      academicYr: json['academic_yr'],
      publish: json['publish'],
      acknowledge: json['acknowledge'],
      isDelete: json['isDelete'],
      teacherName: json['teachername'],
      remarkRLogId: json['remark_r_log_id'],
      readStatus: json['read_status'],
      imageList: (json['image_list'] as List)
          .map((item) => Attachment.fromJson(item))
          .toList(),
    );
  }
  }

class RemarkNoteCard extends StatelessWidget {
  final String date;
  final String teacher;
  final String remarksubject;
  final VoidCallback onTap;


  const RemarkNoteCard({
    Key? key,
    required this.date,
    required this.teacher,
    required this.remarksubject,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(remarkDetailCard);
      },
      child: Stack(
        children: [
          Card(
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
                        'assets/studying.png',
                        height: 60,
                      ),
                      SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                              const TextSpan(
                              text: 'Date: ',
                                // style: Commonstyle.lableBold,


                            ),
                            TextSpan(
                              text: date,

                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Teacher: ',
                               // style: Commonstyle.lableBold,
                            ),
                            TextSpan(
                              text: teacher,

                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),

                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Remark Subject: ',
                               // style: Commonstyle.lableBold,
                            ),
                            TextSpan(
                              text: remarksubject,

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
          const Positioned(
            top: 10,
            right: 12,
            child: Icon(
              Icons.remove_red_eye,
              color: Color.fromARGB(255, 175, 49, 40),
            ),
          ),
        ],
      ),
    );
  }
}