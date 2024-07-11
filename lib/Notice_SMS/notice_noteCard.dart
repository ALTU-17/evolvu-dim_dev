import 'package:evolvu/Notice_SMS/notice_DeatilCard.dart';
import 'package:evolvu/Notice_SMS/notice_DeatilPage.dart';
import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:evolvu/all_routs.dart';
import 'package:flutter/widgets.dart';

class NoticeNoteCard extends StatelessWidget {
  final String teacher;
  final String remarksubject;
  final String type;

  const NoticeNoteCard({
    Key? key,
    required this.teacher,
    required this.remarksubject,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NoticeDetailCard(
              noticeInfo: NoticeInfo(
                classs: 'guidelines.docx',
                date: 'guidelines',
                subject: remarksubject,
                description: 'A r is a machine programs. Th wide range of tasks.',
                attachments: [
                  'sports are starts are starts tarts are starting f',
                  'event schedule.pdf',
                  'guidelines.docx',
                ],
              ),
              type: type,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      // type == 'sms' ? 'assets/chat.png' : 'assets/chat.png',
                      'assets/notice.png',
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type == 'sms' ? 'SMS' : 'Notice',
                          style: Commonstyle.noticeText,
                        ),
                        const SizedBox(height: 5),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Created By: ',
                                style: Commonstyle.lableBold,
                              ),
                              TextSpan(
                                text: teacher,
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
      ),
    );
  }
}
