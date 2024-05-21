import 'package:evolvu/all_routs.dart';
import 'package:evolvu/common/drawerAppBar.dart';
import 'package:evolvu/common/gradiant_container.dart';
import 'package:evolvu/student_activity.dart';
import 'package:evolvu/student_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/studentCardDuplicate.dart';

class ChildDashBoardBoardPage extends StatelessWidget {
  const ChildDashBoardBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return

       Stack(
        children: [
          const GradientContainer(),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                     "My Child",
                     style: TextStyle(
                       fontSize: 16.sp, // Adjust font size as needed
                       fontWeight: FontWeight.bold,
                       color: Colors.white, // Adjust color to fit your design
                     ),
                   ),
                   SizedBox(height: 10.h,),

                  StudentCard1(
                    name: 'SHIFRA',
                    rollno: 'Roll NO : 36',
                    clas: 'Class',
                    div: '5 D',
                    techer: 'Teacher',
                    techName: 'KAVITA RAVIKUMAR \n     DESHPANDE',
                    img: 'assets/girl.png',
                     attendance: "100 %",
                    showAttendanceLabel: true,
                    onTap: () {
                      Navigator.of(context).pushNamed(studentActivityPage);
                    },
                  ),
                  StudentCard1(
                    name: 'GADDIEL',
                    rollno: 'Roll NO : ',
                    clas: 'Class',
                    div: '9 D',
                    techer: 'Teacher',
                    techName: 'KALPANA SINGH',
                    img: 'assets/boy.png',
                     attendance: "75 %",
                   showAttendanceLabel: true,
                    onTap: () {
                       Navigator.of(context).pushNamed(studentActivityPage);
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      );

  }
}
