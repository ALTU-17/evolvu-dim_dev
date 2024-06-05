import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> downloadImage(String imageUrl, String imageName) async {
  if (Platform.isAndroid) {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        Fluttertoast.showToast(
          msg: 'Storage permission is required to download images.',
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
        return;
      }
    }
  } else if (Platform.isIOS) {
    var status = await Permission.photos.status;
    if (!status.isGranted) {
      status = await Permission.photos.request();
      if (!status.isGranted) {
        Fluttertoast.showToast(
          msg: 'Photos permission is required to download images.',
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
        return;
      }
    }
  }

  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  String filePath = '$appDocPath/$imageName';

  try {
    Dio dio = Dio();
    await dio.download(imageUrl, filePath);

    Fluttertoast.showToast(
      msg: 'Image downloaded successfully to $filePath',
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  } catch (e) {
    print('Error downloading image: $e');
    Fluttertoast.showToast(
      msg: 'Failed to download image',
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }
}
