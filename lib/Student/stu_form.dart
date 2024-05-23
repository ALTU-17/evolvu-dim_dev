import 'dart:convert';
import 'dart:io';
import 'package:evolvu/common/Common_dropDownFiled.dart';
import 'package:evolvu/common/common_textFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class stuInfoModal {
  String? studentId;
  String? academicYr;
  String? parentId;
  String? firstName;
  String? midName;
  String? lastName;
  String? studentName;
  String? dob;
  String? gender;
  String? admissionDate;
  String? studIdNo;
  String? motherTongue;
  String? birthPlace;
  String? admissionClass;
  String? rollNo;
  String? classId;
  String? sectionId;
  Null? feesPaid;
  String? bloodGroup;
  String? religion;
  String? caste;
  Null? subcaste;
  String? transportMode;
  String? vehicleNo;
  Null? busId;
  String? emergencyName;
  String? emergencyContact;
  String? emergencyAdd;
  String? height;
  String? weight;
  Null? hasSpecs;
  Null? allergies;
  String? nationality;
  String? permantAdd;
  String? city;
  String? state;
  String? pincode;
  String? isDelete;
  String? prevYearStudentId;
  String? isPromoted;
  String? isNew;
  String? isModify;
  String? isActive;
  String? regNo;
  String? house;
  String? stuAadhaarNo;
  String? category;
  String? lastDate;
  String? slcNo;
  String? slcIssueDate;
  String? leavingRemark;
  Null? deletedDate;
  Null? deletedBy;
  String? imageName;
  String? guardianName;
  String? guardianAdd;
  String? guardianMobile;
  String? relation;
  String? guardianImageName;
  String? udisePenNo;
  Null? addedBkDate;
  Null? addedBy;
  String? className;
  String? sectionName;
  String? teacherId;
  String? classTeacher;

  stuInfoModal(
      {this.studentId,
        this.academicYr,
        this.parentId,
        this.firstName,
        this.midName,
        this.lastName,
        this.studentName,
        this.dob,
        this.gender,
        this.admissionDate,
        this.studIdNo,
        this.motherTongue,
        this.birthPlace,
        this.admissionClass,
        this.rollNo,
        this.classId,
        this.sectionId,
        this.feesPaid,
        this.bloodGroup,
        this.religion,
        this.caste,
        this.subcaste,
        this.transportMode,
        this.vehicleNo,
        this.busId,
        this.emergencyName,
        this.emergencyContact,
        this.emergencyAdd,
        this.height,
        this.weight,
        this.hasSpecs,
        this.allergies,
        this.nationality,
        this.permantAdd,
        this.city,
        this.state,
        this.pincode,
        this.isDelete,
        this.prevYearStudentId,
        this.isPromoted,
        this.isNew,
        this.isModify,
        this.isActive,
        this.regNo,
        this.house,
        this.stuAadhaarNo,
        this.category,
        this.lastDate,
        this.slcNo,
        this.slcIssueDate,
        this.leavingRemark,
        this.deletedDate,
        this.deletedBy,
        this.imageName,
        this.guardianName,
        this.guardianAdd,
        this.guardianMobile,
        this.relation,
        this.guardianImageName,
        this.udisePenNo,
        this.addedBkDate,
        this.addedBy,
        this.className,
        this.sectionName,
        this.teacherId,
        this.classTeacher});

  stuInfoModal.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    academicYr = json['academic_yr'];
    parentId = json['parent_id'];
    firstName = json['first_name'];
    midName = json['mid_name'];
    lastName = json['last_name'];
    studentName = json['student_name'];
    dob = json['dob'];
    gender = json['gender'];
    admissionDate = json['admission_date'];
    studIdNo = json['stud_id_no'];
    motherTongue = json['mother_tongue'];
    birthPlace = json['birth_place'];
    admissionClass = json['admission_class'];
    rollNo = json['roll_no'];
    classId = json['class_id'];
    sectionId = json['section_id'];
    feesPaid = json['fees_paid'];
    bloodGroup = json['blood_group'];
    religion = json['religion'];
    caste = json['caste'];
    subcaste = json['subcaste'];
    transportMode = json['transport_mode'];
    vehicleNo = json['vehicle_no'];
    busId = json['bus_id'];
    emergencyName = json['emergency_name'];
    emergencyContact = json['emergency_contact'];
    emergencyAdd = json['emergency_add'];
    height = json['height'];
    weight = json['weight'];
    // hasSpecs = json['has_specs'];
    // allergies = json['allergies'];
    nationality = json['nationality'];
    permantAdd = json['permant_add'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    isDelete = json['IsDelete'];
    prevYearStudentId = json['prev_year_student_id'];
    isPromoted = json['isPromoted'];
    isNew = json['isNew'];
    isModify = json['isModify'];
    isActive = json['isActive'];
    regNo = json['reg_no'];
    house = json['house'];
    stuAadhaarNo = json['stu_aadhaar_no'];
    category = json['category'];
    lastDate = json['last_date'];
    slcNo = json['slc_no'];
    slcIssueDate = json['slc_issue_date'];
    leavingRemark = json['leaving_remark'];
    deletedDate = json['deleted_date'];
    deletedBy = json['deleted_by'];
    imageName = json['image_name'];
    guardianName = json['guardian_name'];
    guardianAdd = json['guardian_add'];
    guardianMobile = json['guardian_mobile'];
    relation = json['relation'];
    guardianImageName = json['guardian_image_name'];
    udisePenNo = json['udise_pen_no'];
    addedBkDate = json['added_bk_date'];
    addedBy = json['added_by'];
    className = json['class_name'];
    sectionName = json['section_name'];
    teacherId = json['teacher_id'];
    classTeacher = json['class_teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['academic_yr'] = this.academicYr;
    data['parent_id'] = this.parentId;
    data['first_name'] = this.firstName;
    data['mid_name'] = this.midName;
    data['last_name'] = this.lastName;
    data['student_name'] = this.studentName;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['admission_date'] = this.admissionDate;
    data['stud_id_no'] = this.studIdNo;
    data['mother_tongue'] = this.motherTongue;
    data['birth_place'] = this.birthPlace;
    data['admission_class'] = this.admissionClass;
    data['roll_no'] = this.rollNo;
    data['class_id'] = this.classId;
    data['section_id'] = this.sectionId;
    data['fees_paid'] = this.feesPaid;
    data['blood_group'] = this.bloodGroup;
    data['religion'] = this.religion;
    data['caste'] = this.caste;
    data['subcaste'] = this.subcaste;
    data['transport_mode'] = this.transportMode;
    data['vehicle_no'] = this.vehicleNo;
    data['bus_id'] = this.busId;
    data['emergency_name'] = this.emergencyName;
    data['emergency_contact'] = this.emergencyContact;
    data['emergency_add'] = this.emergencyAdd;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['has_specs'] = this.hasSpecs;
    data['allergies'] = this.allergies;
    data['nationality'] = this.nationality;
    data['permant_add'] = this.permantAdd;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['IsDelete'] = this.isDelete;
    data['prev_year_student_id'] = this.prevYearStudentId;
    data['isPromoted'] = this.isPromoted;
    data['isNew'] = this.isNew;
    data['isModify'] = this.isModify;
    data['isActive'] = this.isActive;
    data['reg_no'] = this.regNo;
    data['house'] = this.house;
    data['stu_aadhaar_no'] = this.stuAadhaarNo;
    data['category'] = this.category;
    data['last_date'] = this.lastDate;
    data['slc_no'] = this.slcNo;
    data['slc_issue_date'] = this.slcIssueDate;
    data['leaving_remark'] = this.leavingRemark;
    data['deleted_date'] = this.deletedDate;
    data['deleted_by'] = this.deletedBy;
    data['image_name'] = this.imageName;
    data['guardian_name'] = this.guardianName;
    data['guardian_add'] = this.guardianAdd;
    data['guardian_mobile'] = this.guardianMobile;
    data['relation'] = this.relation;
    data['guardian_image_name'] = this.guardianImageName;
    data['udise_pen_no'] = this.udisePenNo;
    data['added_bk_date'] = this.addedBkDate;
    data['added_by'] = this.addedBy;
    data['class_name'] = this.className;
    data['section_name'] = this.sectionName;
    data['teacher_id'] = this.teacherId;
    data['class_teacher'] = this.classTeacher;
    return data;
  }
}


class childd {
  final String first_name;
  // final String name;
  // final String shortName;
  // final String url;
  // final String teacherApkUrl;
  // final String projectUrl;
  // final String defaultPassword;

  childd({
    required this.first_name,
    // required this.name,
    // required this.shortName,
    // required this.url,
    // required this.teacherApkUrl,
    // required this.projectUrl,
    // required this.defaultPassword,
  });

  // Method to deserialize JSON into SchoolInfo object
  factory childd.fromJson(Map<String, dynamic> json) {
    return childd(
      first_name: json['first_name'],
      // name: json['name'],
      // shortName: json['short_name'],
      // url: json['url'],
      // teacherApkUrl: json['teacherapk_url'],
      // projectUrl: json['project_url'],
      // defaultPassword: json['default_password'],
    );
  }

  // Method to serialize SchoolInfo object into JSON
  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      // 'name': name,
      // 'short_name': shortName,
      // 'url': url,
      // 'teacherapk_url': teacherApkUrl,
      // 'project_url': projectUrl,
      // 'default_password': defaultPassword,
    };
  }
}

class StudentForm extends StatefulWidget {
  final String studentId;

  StudentForm(this.studentId);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  // String firstName = "";
  // String class_name = "";
  // String class_teacher = "";
  // String roll_no = "";
 
  File? file;
  String shortName = "";
  String academic_yrstr = "";
  String reg_idstr = "";
  String projectUrl = "";
  String url = "";
  String imageUrl = "";
  stuInfoModal? childInfo;

  Future<void> _getSchoolInfo(String studentId) async {
    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');
    String? logUrls = prefs.getString('logUrls');
    print('logUrls====\\\\\: $logUrls');
    if (logUrls != null) {
      try {
        Map<String, dynamic> logUrlsparsed = json.decode(logUrls);
        print('logUrls====\\\\\11111: $logUrls');

        academic_yrstr = logUrlsparsed['academic_yr'];
        reg_idstr = logUrlsparsed['reg_id'];
        // shortName = logUrlsparsed['short_name'];

        print('academic_yr ID: $academic_yrstr');
        print('reg_id: $reg_idstr');
      } catch (e) {
        print('Error parsing school info: $e');
      }
    } else {
      print('School info not found in SharedPreferences.');
    }

    if (schoolInfoJson != null) {
      try {
        Map<String, dynamic> parsedData = json.decode(schoolInfoJson);

        String schoolId = parsedData['school_id'];
        String name = parsedData['name'];
        shortName = parsedData['short_name'];
        url = parsedData['url'];
        String teacherApkUrl = parsedData['teacherapk_url'];
         projectUrl = parsedData['project_url'];
        String defaultPassword = parsedData['default_password'];

        print('Short Name: $shortName');
        print('URL1111: $url');
        print('Teacher APK URL: $teacherApkUrl');
        print('Project URL: $projectUrl');
        print('Default Password: $defaultPassword');
      } catch (e) {
        print('Error parsing school info: $e');
      }
    } else {
      print('School info not found in SharedPreferences.');
    }

    http.Response response = await http.post(
      Uri.parse(url + "get_childs"),
      body: {
        'reg_id': reg_idstr,
        'academic_yr': academic_yrstr,
        'short_name': shortName
      },
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print('Response ```````````11111111111```````````');
      // Assuming 'response' contains the API response
      List<dynamic> apiResponse = json.decode(response.body);

      Map<String, dynamic> data = apiResponse[0];
       childInfo = stuInfoModal.fromJson(data);
      print('First Name222222: ${childInfo?.firstName}');

      // Assuming the API response contains only one object, you can access it like this
      // Map<String, dynamic> childInfo = apiResponse[0];
      //
      // studentId = childInfo['student_id'];
      // String academicYr = childInfo['academic_yr'];
      // String parentId = childInfo['parent_id'];
      // firstName = childInfo['first_name'];
      // String midName = childInfo['mid_name'];
      // String lastName = childInfo['last_name'];
      // String studentName = childInfo['student_name'];
      // String dob = childInfo['dob'];
      // String gender = childInfo['gender'];
      // String admissionDate = childInfo['admission_date'];
      // class_name = childInfo['class_name'] + childInfo['section_name'];
      // String studIdNo = childInfo['stud_id_no'];
      // roll_no = childInfo['roll_no'];
      // class_teacher = childInfo['class_teacher'];
    }

    imageUrl = projectUrl+"uploads/student_image/$studentId.jpg";

    print('Image URL@@@@@: $imageUrl');
    //
    // http.Response get_student_profile_images_details = await http.post(
    //   Uri.parse(url + "get_student_profile_images_details"),
    //   body: {
    //     'student_id': studentId,
    //     // 'academic_yr': academic_yr,
    //     'short_name': shortName
    //   },
    // );
    //
    // print(
    //     'get_student_profile_images_details status code: ${get_student_profile_images_details.statusCode}');
    // print(
    //     'get_student_profile_images_details Response body====:>  ${get_student_profile_images_details.body}');
    //
    // if (get_student_profile_images_details.statusCode == 200) {
    //   // Parse the JSON response body
    //   Map<String, dynamic> responseData =
    //   json.decode(get_student_profile_images_details.body);
    //
    //   // Extract the 'image_url' from the 'data' object
    //   imageUrl = responseData['image_url'];
    //
    //   // Print the imageUrl
    //   print('Image URL: $imageUrl');
    // }
  }

  Future uploadImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
    );
    if (image == null) return;

    // Convert the image path to a File
    File imageFile = File(image.path);

    var croppedFile = await cropImage(imageFile);

    // Update the file variable with the cropped image
    setState(() {
      file = croppedFile;
    });
  }

  // Function to crop the selected image using the image_cropper package
  Future<File?> cropImage(File pickedFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        statusBarColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    );

    // Returning the edited/cropped image if available, otherwise the original image
    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return File(pickedFile.path);
    }
  }

  @override
  void initState() {
    super.initState();

    _getSchoolInfo(widget.studentId);

  }

  @override
  Widget build(BuildContext context) {
    // _getSchoolInfo();
    // return FutureBuilder(
    //     future: _getSchoolInfo(widget.studentId),
    // builder: (context, snapshot) {
          return SizedBox(
            height: 120.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: FormBuilder(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 220.h,
                            width: 200.w,
                            child: Stack(
                              children: [
                                Positioned(
                                  height: 150.w,
                                  left: 0,
                                  right: 0,
                                  top: 30.h,
                                  child: ClipRRect(
                                    child: imageUrl.isNotEmpty
                                        ? Image.network(
                                      imageUrl, // Append a timestamp as a query parameter to force reload
                                      fit: BoxFit.contain,
                                    )
                                        : Image.asset(
                                      childInfo?.gender == 'M' ? 'assets/boy.png' : 'assets/girl.png', // Replace with your actual image paths

                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 150,
                                  bottom: 10,
                                  child: Container(
                                    width: 48.w,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 1, 24, 43)
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      iconSize: 24.sp,
                                      color: Colors.white,
                                      onPressed: () {
                                        uploadImage(ImageSource.gallery);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CustomTextField(
                            label: 'First Name',
                            name: 'First a',
                            initialValue: childInfo?.firstName ?? '',// Access first_name here
                          ),

                          CustomTextField(
                            label: 'Middle Name',
                            name: 'Middle Name',
                          ),

                          CustomTextField(
                            label: 'Last Name',
                            name: 'Last Name',
                          ),

                          CustomTextField(
                            label: 'Date Of Birth',
                            name: 'Date Of Birth',
                          ),
                          CustomTextField(
                            label: 'Date Of Admission',
                            name: 'Date Of Admission',
                          ),

                          CustomTextField(
                            label: 'GRN NO.',
                            name: 'GRN NO.',
                          ),

                          CustomTextField(
                            label: 'Student ID NO.',
                            name: 'Student ID NO.',
                          ),
                          CustomTextField(
                            label: 'Udise Pen No.',
                            name: 'Udise Pen No.',
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Student Aadhaar NO.',
                            ),
                          ),

                          LabeledDropdown(
                            label: "House",
                            options: [
                              'Diamond',
                              'Emerald',
                              'Ruby',
                              'Sapphire'
                            ],
                            onChanged: (newValue) {
                              // Here you can handle the change
                              print("Selected: $newValue");
                            },
                          ),

                          CustomTextField(
                            label: 'Admitted In Class',
                            name: 'Admitted In Class',
                          ),

                          CustomTextField(
                            label: 'Class ',
                            name: 'Class ',
                          ),
                          CustomTextField(
                            label: 'Division ',
                            name: 'Division ',
                          ),
                          CustomTextField(
                            label: 'Roll No. ',
                            name: 'Roll No. ',
                          ),
                          LabeledDropdown(
                            label: "Gender",
                            options: ['Male', 'Female'],
                            onChanged: (newValue) {
                              // Here you can handle the change
                              print("Selected: $newValue");
                            },
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Blood Group',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nationality',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Address',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'City',
                            ),
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'State',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Pincode',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Birth Place',
                            ),
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Mother Tongue',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Religion',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Caste',
                            ),
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Category',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Emergency Name',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Emergency Address',
                            ),
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Emergency Contact',
                            ),
                          ),
                          LabeledDropdown(
                            label: "Transport Mode",
                            options: ['School Bus', 'Private Van', 'Self'],
                            onChanged: (newValue) {
                              // Here you can handle the change
                              print("Selected: $newValue");
                            },
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Allergies(If ANY)',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Height',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Weight',
                            ),
                          ),
                          LabeledDropdown(
                            label: "Has Spectacles?",
                            options: ['YES', 'NO'],
                            onChanged: (newValue) {
                              // Here you can handle the change
                              print("Selected: $newValue");
                            },
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 72, vertical: 12),
                            ),
                            child: Text(
                              'Upadte',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
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
    //   },
    // );
  }
}
