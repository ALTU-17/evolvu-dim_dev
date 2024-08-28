import 'package:evolvu/Notice_SMS/notice_DeatilCard.dart';
import 'package:evolvu/Notice_SMS/notice_DeatilPage.dart';
import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoticeNoteCard extends StatelessWidget {
  final String teacher;
  final String remarksubject;
  final String type;
  final String readStatus;
  final VoidCallback onTap;

  const NoticeNoteCard({

    required this.teacher,
    required this.remarksubject,
    required this.type,
    required this.readStatus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    Color cardColor = readStatus == '0'
        ? Colors.grey
        : Colors.white;

    return GestureDetector(
      onTap: onTap,
        child: Card(
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      // type == 'sms' ? 'assets/notice.png' : 'assets/notice.png',
                      'assets/notice.png',
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type,
                          style: Commonstyle.noticeText,
                        ),
                        const SizedBox(height: 5),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Created By: ',
                                // style: Commonstyle.lableBold,
                                style: TextStyle(

                                  // color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: teacher,
                                style: TextStyle(
                                  // color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(remarksubject),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
