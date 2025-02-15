import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:evolvu/common/Common_dropDownFiled.dart';
import 'package:evolvu/common/common_textFiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StuInfoModal {
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
  dynamic feesPaid;
  String? bloodGroup;
  String? religion;
  String? caste;
  dynamic subcaste;
  String? transportMode;
  String? vehicleNo;
  dynamic busId;
  String? emergencyName;
  String? emergencyContact;
  String? emergencyAdd;
  String? height;
  String? weight;
  String? hasSpecs;
  String? allergies;
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
  dynamic deletedDate;
  dynamic deletedBy;
  String? imageName;
  String? guardianName;
  String? guardianAdd;
  String? guardianMobile;
  String? relation;
  String? guardianImageName;
  String? udisePenNo;
  dynamic addedBkDate;
  dynamic addedBy;
  String? className;
  String? sectionName;
  String? teacherId;
  String? classTeacher;

  StuInfoModal(
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

  StuInfoModal.fromJson(Map<String, dynamic> json) {
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
    hasSpecs = json['has_specs'];
    allergies = json['allergies'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['academic_yr'] = academicYr;
    data['parent_id'] = parentId;
    data['first_name'] = firstName;
    data['mid_name'] = midName;
    data['last_name'] = lastName;
    data['student_name'] = studentName;
    data['dob'] = dob;
    data['gender'] = gender;
    data['admission_date'] = admissionDate;
    data['stud_id_no'] = studIdNo;
    data['mother_tongue'] = motherTongue;
    data['birth_place'] = birthPlace;
    data['admission_class'] = admissionClass;
    data['roll_no'] = rollNo;
    data['class_id'] = classId;
    data['section_id'] = sectionId;
    data['fees_paid'] = feesPaid;
    data['blood_group'] = bloodGroup;
    data['religion'] = religion;
    data['caste'] = caste;
    data['subcaste'] = subcaste;
    data['transport_mode'] = transportMode;
    data['vehicle_no'] = vehicleNo;
    data['bus_id'] = busId;
    data['emergency_name'] = emergencyName;
    data['emergency_contact'] = emergencyContact;
    data['emergency_add'] = emergencyAdd;
    data['height'] = height;
    data['weight'] = weight;
    data['has_specs'] = hasSpecs;
    data['allergies'] = allergies;
    data['nationality'] = nationality;
    data['permant_add'] = permantAdd;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['IsDelete'] = isDelete;
    data['prev_year_student_id'] = prevYearStudentId;
    data['isPromoted'] = isPromoted;
    data['isNew'] = isNew;
    data['isModify'] = isModify;
    data['isActive'] = isActive;
    data['reg_no'] = regNo;
    data['house'] = house;
    data['stu_aadhaar_no'] = stuAadhaarNo;
    data['category'] = category;
    data['last_date'] = lastDate;
    data['slc_no'] = slcNo;
    data['slc_issue_date'] = slcIssueDate;
    data['leaving_remark'] = leavingRemark;
    data['deleted_date'] = deletedDate;
    data['deleted_by'] = deletedBy;
    data['image_name'] = imageName;
    data['guardian_name'] = guardianName;
    data['guardian_add'] = guardianAdd;
    data['guardian_mobile'] = guardianMobile;
    data['relation'] = relation;
    data['guardian_image_name'] = guardianImageName;
    data['udise_pen_no'] = udisePenNo;
    data['added_bk_date'] = addedBkDate;
    data['added_by'] = addedBy;
    data['class_name'] = className;
    data['section_name'] = sectionName;
    data['teacher_id'] = teacherId;
    data['class_teacher'] = classTeacher;
    return data;
  }
}

class StudentForm extends StatefulWidget {
  final String studentId;

  const StudentForm(this.studentId, {super.key});

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  File? file;
  String shortName = "";
  String academic_yrstr = "";
  String reg_idstr = "";
  String projectUrl = "";
  String url = "";
  String imageUrl = "";
  StuInfoModal? childInfo;

  Map<String, dynamic> updatedData = {};

  void _handleChanged(String key, String? value) {
    if (value != null && value.isNotEmpty) {
      updatedData[key] = value;
    } else {
      updatedData.remove(key);
    }
  }

  Map<String, String> specsMapping = {
    'Y': 'YES',
    'N': 'NO',
  };

  Map<String, String> genderMapping = {
    'M': 'Male',
    'F': 'Female',
  };
  Map<String, String> TransMapping = {
    'Self': 'Self',
    'School Bus': 'School Bus',
    'Private Van': 'Private Van',
  };
  Map<String, String> houseMapping = {
    'D': 'Diamond',
    'E': 'Emerald',
    'R': 'Ruby',
    'S': 'Sapphire'
  };

// Method to get the full house name from the abbreviation
  String getFullHouseName(String? abbreviation) {
    if (abbreviation == null || abbreviation.isEmpty) {
      return '';
    }
    return houseMapping[abbreviation] ?? abbreviation;
  }

  String getGender(String? abbreviation) {
    if (abbreviation == null || abbreviation.isEmpty) {
      return '';
    }
    return genderMapping[abbreviation] ?? abbreviation;
  }

  String getTrans(String? abbreviation) {
    if (abbreviation == null || abbreviation.isEmpty) {
      return '';
    }
    return TransMapping[abbreviation] ?? abbreviation;
  }

  String getSpecs(String? abbreviation) {
    if (abbreviation == null || abbreviation.isEmpty) {
      return '';
    }
    return specsMapping[abbreviation] ?? abbreviation;
  }

  Future<StuInfoModal?> _getSchoolInfo(String studentId) async {
    final prefs = await SharedPreferences.getInstance();
    String? schoolInfoJson = prefs.getString('school_info');
    String? logUrls = prefs.getString('logUrls');
    print('logUrls====\\\\: $logUrls');
    if (logUrls != null) {
      try {
        Map<String, dynamic> logUrlsparsed = json.decode(logUrls);
        print('logUrls====\\\\11111: $logUrls');

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
      Uri.parse("${url}get_student"),
      body: {
        'student_id': studentId,
        'academic_yr': academic_yrstr,
        'short_name': shortName
      },
    );
    imageUrl = "${projectUrl}uploads/student_image/$studentId.jpg";
    print('Response status code: ${response.statusCode}');
    print('get_student body: ${response.body}');

    if (response.statusCode == 200) {
      print('Response ```````11111111111```````');
      // Assuming 'response' contains the API response
      List<dynamic> apiResponse = json.decode(response.body);

      Map<String, dynamic> data = apiResponse[0];
      setState(() {
        isLoading = false;
        // visitors = uniqueVisitors;
      });
      return StuInfoModal.fromJson(data);

    }
    return null;
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
    // Upload the cropped image to the server
    imageUrl = await uploadImageToServer(croppedFile!);

    // Set the image using the received URL
    setState(() {
      imageUrl = imageUrl;
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
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        statusBarColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
      iosUiSettings: const IOSUiSettings(
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

  Future<String> uploadImageToServer(File croppedImage) async {
    // Create a multipart request using Dio package

    try {
      // Make POST request to upload image
      http.Response uploadresponse = await http.post(
        Uri.parse("${url}get_student_profile_images_details"),
        body: {'student_id': widget.studentId, 'short_name': shortName},
      );
      print('image_urlResponse body: ${uploadresponse.body}');
      // Check if response is successful
      if (uploadresponse.statusCode == 200) {
        // Parse the response JSON and extract image URL
        String uploadresponsestr = uploadresponse.body;
        Map<String, dynamic> uploadresponsedata =
            json.decode(uploadresponsestr);
        imageUrl = uploadresponsedata["image_url"];
        return imageUrl;
      } else {
        // Handle error
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      // Handle Dio errors
      print("Error uploading image: $e");
      throw Exception('Failed to upload image');
    }
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _init();
    // _getSchoolInfo(widget.studentId);
  }

  _init() async {
    childInfo = await _getSchoolInfo(widget.studentId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(10),
            child: isLoading
                ? Center(
                    child:
                        CircularProgressIndicator(), // Show loading indicator while fetching data
                  ) : childInfo != null
                ? SingleChildScrollView(
                    child: FormBuilder(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200.h,
                            width: 200.w,
                            child: Stack(
                              children: [
                                Positioned(
                                  height: 150.w,
                                  left: 0,
                                  right: 0,
                                  top: 10.h,
                                  child: ClipRRect(
                                    child: imageUrl.isNotEmpty
                                        ? Image.network(
                                            imageUrl,
                                            // Append a timestamp as a query parameter to force reload
                                            fit: BoxFit.contain,
                                          )
                                        : Image.asset(
                                            childInfo?.gender == 'F'
                                                ? 'assets/girl.png'
                                                : 'assets/boy.png',
                                            // Replace with your actual image paths

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
                            readOnly: true,
                            initialValue: childInfo?.firstName,
                          ),

                          CustomTextField(
                            // initialValue: ,
                            label: 'Middle Name',
                            name: 'Middle Name',
                            readOnly: true,
                            initialValue: childInfo?.midName,
                          ),

                          CustomTextField(
                            label: 'Last Name',
                            name: 'Last Name',
                            readOnly: true,
                            initialValue: childInfo?.lastName,
                          ),

                          CustomTextField(
                            label: 'Date Of Birth',
                            name: 'Date Of Birth',
                            readOnly: true,
                            initialValue: childInfo?.dob,
                          ),
                          CustomTextField(
                            label: 'Date Of Admission',
                            name: 'Date Of Admission',
                            readOnly: true,
                            initialValue: childInfo?.admissionDate,
                          ),

                          CustomTextField(
                            label: 'GRN NO.',
                            name: 'GRN NO.',
                            readOnly: true,
                            initialValue: childInfo?.regNo,
                          ),

                          CustomTextField(
                            label: 'Student ID NO.',
                            name: 'Student ID NO.',
                            readOnly: true,
                            initialValue: childInfo?.studIdNo,
                          ),
                          CustomTextField(
                            label: 'Udise Pen No.',
                            name: 'Udise Pen No.',
                            readOnly: true,
                            initialValue: childInfo?.udisePenNo,
                          ),

                          TextFormField(
                            initialValue: childInfo?.stuAadhaarNo,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Student Aadhaar NO.',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.stuAadhaarNo = value;
                              });
                            },
                          ),

                          LabeledDropdown(
                            label:
                                'House :  ${getFullHouseName(childInfo!.house)}',

                            options: ['Diamond', 'Emerald', 'Ruby', 'Sapphire'],
                            // initialValue: childInfo?.house,  // This should be the abbreviation, e.g., 'D'

                            onChanged: (String? newValue) {
                              setState(() {
                                if (newValue != null) {
                                  childInfo?.house = newValue;
                                }
                              });
                            },
                          ),

                          // Display the full house name
                          // if (childInfo?.house != null)
                          //   Text('House: ${getFullHouseName(childInfo!.house)}'),

                          CustomTextField(
                            label: 'Admitted In Class',
                            name: 'Admitted In Class',
                            initialValue: childInfo?.admissionClass,
                          ),

                          CustomTextField(
                            initialValue: childInfo?.className,
                            label: 'Class ',
                            name: 'Class ',
                            readOnly: true,
                          ),
                          CustomTextField(
                            initialValue: childInfo?.sectionName,
                            readOnly: true,
                            label: 'Division ',
                            name: 'Division ',
                          ),
                          CustomTextField(
                            readOnly: true,
                            initialValue: childInfo?.rollNo,
                            label: 'Roll No. ',
                            name: 'Roll No. ',
                          ),
                          LabeledDropdown(
                            label: "Gender :  ${getGender(childInfo!.gender)}",
                            options: ['Male', 'Female'],
                            onChanged: (String? newValue) {
                              setState(() {
                                if (newValue != null) {
                                  childInfo?.gender = newValue;
                                }
                              });
                            },
                          ),

                          TextFormField(
                            initialValue: childInfo?.bloodGroup,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Blood Group',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.bloodGroup = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.nationality,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nationality',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.nationality = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.permantAdd,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Address',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.permantAdd = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.city,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'City',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.city = value;
                              });
                            },
                          ),

                          TextFormField(
                            initialValue: childInfo?.state,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'State',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.state = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.pincode,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Pincode',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.pincode = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.birthPlace,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Birth Place',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.birthPlace = value;
                              });
                            },
                          ),

                          TextFormField(
                            initialValue: childInfo?.motherTongue,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Mother Tongue',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.motherTongue = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.religion,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Religion',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.religion = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.caste,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Caste',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.caste = value;
                              });
                            },
                          ),

                          TextFormField(
                            initialValue: childInfo?.category,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Category',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.category = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.emergencyName,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Emergency Name',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.emergencyName = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.emergencyAdd,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Emergency Address',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.emergencyAdd = value;
                              });
                            },
                          ),

                          TextFormField(
                            initialValue: childInfo?.emergencyContact,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Emergency Contact',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.emergencyContact = value;
                              });
                            },
                          ),

                          //////////////
                          LabeledDropdown(
                            label:
                                "Transport Mode :  ${getTrans(childInfo!.transportMode)}",
                            options: ['School Bus', 'Private Van', 'Self'],
                            onChanged: (String? newValue) {
                              setState(() {
                                if (newValue != null) {
                                  childInfo?.transportMode = newValue;
                                }
                              });
                            },
                          ),
                          SizedBox(height: 10),

                          TextFormField(
                            initialValue: childInfo?.allergies,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Allergies(If ANY)',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.allergies = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.height,
                            decoration: InputDecoration(
                              hintText: "4.1",
                              border: UnderlineInputBorder(),
                              labelText: 'Height',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.height = value;
                              });
                            },
                          ),
                          TextFormField(
                            initialValue: childInfo?.weight,
                            decoration: InputDecoration(
                              hintText: "50",
                              border: UnderlineInputBorder(),
                              labelText: 'Weight',
                            ),
                            onChanged: (value) {
                              setState(() {
                                childInfo?.weight = value;
                              });
                            },
                          ),
                          LabeledDropdown(
                            label:
                                "Has Spectacles? :  ${getSpecs(childInfo!.hasSpecs)}",
                            options: ['YES', 'NO'],
                            onChanged: (String? newValue) {
                              setState(() {
                                if (newValue != null) {
                                  childInfo?.hasSpecs = newValue;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              print('###### body: ${childInfo?.allergies}');

                              try {
                                Response response = await post(
                                  Uri.parse("${url}update_student"),
                                  body: {
                                    'short_name': shortName ?? '',
                                    'student_id': childInfo?.studentId ?? '',
                                    'stu_aadhaar_no':
                                        childInfo?.stuAadhaarNo ?? '',
                                    'nationality': childInfo?.nationality ?? '',
                                    'permant_add': childInfo?.permantAdd ?? '',
                                    'city': childInfo?.city ?? '',
                                    'state': childInfo?.state ?? '',
                                    'pincode': childInfo?.pincode ?? '',
                                    'caste': childInfo?.caste ?? '',
                                    'religion': childInfo?.religion ?? '',
                                    'category': childInfo?.category ?? '',
                                    'emergency_contact':
                                        childInfo?.emergencyContact ?? '',
                                    'emergency_name':
                                        childInfo?.emergencyName ?? '',
                                    'emergency_add':
                                        childInfo?.emergencyAdd ?? '',
                                    'transport_mode':
                                        childInfo?.transportMode ?? '',
                                    'vehicle_no': childInfo?.vehicleNo ?? '',
                                    'has_specs': childInfo?.hasSpecs ?? '',
                                    'birth_place': childInfo?.birthPlace ?? '',
                                    'mother_tongue':
                                        childInfo?.motherTongue ?? '',
                                    'stud_id_no': childInfo?.studIdNo ?? '',
                                    'admission_class':
                                        childInfo?.admissionClass ?? '',
                                    'allergies': childInfo?.allergies ?? '',
                                  },
                                );

                                // print('Response body: $qrCode $academic_yr $formattedTime $formattedDate');
                                print('Response body: ${response.body}');
                                print(
                                    'childInfo?.stuAadhaarNo33##### body: ${childInfo?.stuAadhaarNo}');

                                if (response.statusCode == 200) {
                                  Fluttertoast.showToast(
                                    msg: "Profile updated successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Failed to update Profile",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }
                              } catch (e) {
                                print('Exception: $e');
                              }

                              // UpdateStudent(context,childInfo?.studentId);
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
                  ): Center(
              child: Text('No visitors found', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
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
