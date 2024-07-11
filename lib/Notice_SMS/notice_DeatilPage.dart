import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeInfo {
  final String classs;
  final String date;
  final String subject;
  final String description;
  final List<String> attachments;

  NoticeInfo({
    required this.classs,
    required this.date,
    required this.subject,
    required this.description,
    required this.attachments,
  });
}
class NoticeDetailPage extends StatefulWidget {
  final NoticeInfo noticeInfo;
  final bool showAttachments;

  const NoticeDetailPage({
    super.key,
    required this.noticeInfo,
    required this.showAttachments,
  });

  @override
  _NoticeDetailPageState createState() => _NoticeDetailPageState();
}

class _NoticeDetailPageState extends State<NoticeDetailPage> {
  bool _showAttachments = true;

  @override
  void initState() {
    super.initState();
    _showAttachments = widget.showAttachments;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showAttachments = !_showAttachments;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRow('Class:', widget.noticeInfo.classs),
            SizedBox(height: 4.h),
            buildRow('Date:', widget.noticeInfo.date),
            SizedBox(height: 4.h),
            buildRow('Subject:', widget.noticeInfo.subject),
            SizedBox(height: 4.h),
            buildRow('Description:', widget.noticeInfo.description),
            SizedBox(height: 4.h),
            if (_showAttachments) buildAttachmentsRow('Attachments:', widget.noticeInfo.attachments),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            label,
            style: Commonstyle.lableBold,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAttachmentsRow(String label, List<String> attachments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100.0,
              child: Text(
                label,
                style: Commonstyle.lableBold,
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(attachments.length, (index) {
            final attachment = attachments[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      attachment,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
