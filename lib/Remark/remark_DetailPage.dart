import 'package:evolvu/common/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Teacher/Attachment.dart';

class RemarkInfo {
  final String description;
  final List<Attachment> attachment;

  RemarkInfo({
    required this.description,
    required this.attachment,
  });
}

class RemarkDetailPage extends StatelessWidget {
  final RemarkInfo remarkInfo;

  const RemarkDetailPage({super.key, required this.remarkInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 720.h,
      margin: const EdgeInsets.all(1.0),
      padding: const EdgeInsets.all(16.0),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  remarkInfo.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Attachment:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Expanded(
                        //   child: Text(
                        //     remarkInfo.attachment,
                        //     style: const TextStyle(
                        //       fontSize: 14,
                        //     ),
                        //   ),
                        // ),
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
                   
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
