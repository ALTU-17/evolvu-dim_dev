import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReceiptWebViewScreen extends StatefulWidget {
  final String receiptUrl;

  ReceiptWebViewScreen({required this.receiptUrl});

  @override
  _ReceiptWebViewScreenState createState() => _ReceiptWebViewScreenState();
}

class _ReceiptWebViewScreenState extends State<ReceiptWebViewScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.receiptUrl));
  }

  Future<void> _downloadFile(String url) async {
    // Request permission to write to external storage
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        // Get downloads directory
        Directory? downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
        String filePath = '${downloadsDirectory!.path}/Evolvuschool/Parent/Receipt/receipt.pdf';

        // Download the file
        var response = await http.get(Uri.parse(url));
        File file = File(filePath);
        await file.create(recursive: true);
        await file.writeAsBytes(response.bodyBytes);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Downloaded to $filePath')),
        );
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download file.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission denied.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60.h,
        title: Text(
          'Receipt',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Expanded(
              child: WebViewWidget(controller: _controller),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () async {
          // Get the current URL and download the PDF
          String? currentUrl = await _controller.currentUrl();
          print('Current URL: $currentUrl');
          if (currentUrl != null && currentUrl.endsWith(".pdf")) {
            await _downloadFile(currentUrl);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('No PDF found to download.')),
            );
          }
        },
      ),
    );
  }
}
