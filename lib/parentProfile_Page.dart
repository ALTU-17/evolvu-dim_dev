import 'package:evolvu/common/Common_dropDownFiled.dart';
import 'package:evolvu/common/common_textFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentProfilePage extends StatelessWidget {
  const ParentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: FormBuilder(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Parent Profile",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      label: 'Father Name',
                      name: 'Father_Name',
                      
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Occupation',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Office Address',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Telephone',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Mobile Number',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email id',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Adhar Card no.',
                      ),
                    ),
                    CustomTextField(
                      label: 'Mother Name',
                      name: 'Mother_Name',
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Occupation',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Office Address',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Telephone',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Mobile Number',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email id',
                      ),
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pushNamed();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: StadiumBorder(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 72, vertical: 12),
                      ),
                      child: Text(
                        'Upadte',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                    // Continue adding more fields or other widgets
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
