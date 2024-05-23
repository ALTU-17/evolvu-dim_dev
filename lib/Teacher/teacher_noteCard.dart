import 'package:evolvu/all_routs.dart';
import 'package:evolvu/Teacher/teacher_DeatilCard.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String name;
  final String date;
  final String note;

  // final Widget Function() onTap;

  const NoteCard({
    Key? key,
    required this.name,
    required this.date,
    required this.note,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TeacherDetailCard()),
        );
        },
      child: Card(
        color: const Color.fromARGB(255, 233, 221, 221),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/teacher.png', // Replace with your logo image
                    height: 55,
                  ),
                  SizedBox(width: 15),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    child: Text(
                      'Date: $date',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              const SizedBox(height: 5),
              Text(
                'Note: $note',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
