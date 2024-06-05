import 'dart:convert';
import 'package:evolvu/all_routs.dart';
import 'package:evolvu/Teacher/teacher_DeatilCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:evolvu/Teacher/teacher_DeatilCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Attachment.dart';

class TeacherNote {
  final String notesId;
  final String date;
  final String description;
  final String name;
  final String subjectName;
  final String className;
  final String publish;
  final String read_status;
  final List<Attachment> imageList;

  TeacherNote({
    required this.notesId,
    required this.date,
    required this.description,
    required this.name,
    required this.subjectName,
    required this.className,
    required this.publish,
    required this.read_status,
    required this.imageList,

  });

  factory TeacherNote.fromJson(Map<String, dynamic> json) {
    return TeacherNote(
      notesId: json['notes_id'],
      date: json['date'],
      description: json['description'],
      name: json['name'],
      subjectName: json['subject_name'] ?? 'N/A',
      className: json['classname'],
      publish: json['publish'],
      read_status: json['read_status'],
      imageList: (json['image_list'] as List)
          .map((item) => Attachment.fromJson(item))
          .toList(),
    );
  }
}
// class Attachment {
//   final String imageName;
//   final double fileSize;
//
//   Attachment({required this.imageName, required this.fileSize});
//
//   factory Attachment.fromJson(Map<String, dynamic> json) {
//     return Attachment(
//       imageName: json['image_name'],
//       fileSize: json['file_size'],
//     );
//   }
// }
// note_card.dart



class NoteCard extends StatelessWidget {
  final String name;
  final String date;
  final String note;
  final String subject;
  final String classname;
  final String readStatus;
  final VoidCallback onTap;

  const NoteCard({
    Key? key,
    required this.name,
    required this.date,
    required this.note,
    required this.subject,
    required this.classname,
    required this.readStatus,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);

    Color cardColor = readStatus == '0'
        ? Colors.grey
        : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/teacher.png', // Replace with your logo image
                    height: 55,
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      'Date: $formattedDate',
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              const Divider(thickness: 2),
              const SizedBox(height: 2),
              Text(
                'Subject: $subject',
                style: const TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),Text(
                'Note: $note',
                style: const TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}