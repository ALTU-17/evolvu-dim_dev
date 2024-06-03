import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:evolvu/all_routs.dart';

class HomeWorkNoteCard extends StatelessWidget {
  final String subject;
  final String assignedDate;
  final String submissionDate;
  final String status;

  const HomeWorkNoteCard({
    Key? key,
    required this.subject,
    required this.assignedDate,
    required this.submissionDate,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(homeWorkDetailCard);
      },
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
                    'assets/homework.jpeg',
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
                              text: 'Subject: ',
                                // style: Commonstyle.lableBold,
                            
                            
                            ),
                            TextSpan(
                              text: subject,
                              
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
