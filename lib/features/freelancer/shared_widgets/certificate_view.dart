import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:agent_dart/agent_dart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
class ViewCertificate extends StatelessWidget {
  ViewCertificate({Key? key}) : super(key: key);

  final courseName = Get.arguments[1];

  // ------------------------------
  // Saving Image
  // ------------------------------

  Future<void> saveImageToGallery(Uint8List imageData) async {
    // Writing the image bytes to a temporary file
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp_image.png');
    await tempFile.writeAsBytes(imageData);

    // Saving the image to the gallery
    final result = await ImageGallerySaver.saveFile(tempFile.path);
    print(result);
  }

  // ------------------------------
  // Saving PDF
  // ------------------------------

  Future<void> saveImageAsPdf(Uint8List imageData) async {

    // Creating a PDF document and add the image as a page
    final pdf = pw.Document();
    final image = pw.MemoryImage(imageData);
    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Center(child: pw.Image(image));
    }));

    // Requesting storage permission
    await _requestPermission();
    // Getting the current timestamp
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    // Constructing a unique filename with the courseId and timestamp
    final String fileName = '${courseName}_$timestamp.pdf';
    // Getting the document directory path
    final String newPath = '/storage/emulated/0/Download/$fileName';
    final File file = File(newPath);

    // Saving the PDF file
    await file.writeAsBytes(await pdf.save(), flush: true);

    // File path
    print('PDF saved: ${file.path}');
  }

  Future<void> _requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  // Future<String> _findPath() async {
  //   final directory = Platform.isAndroid
  //       ? await getExternalStorageDirectory()
  //       : await getApplicationDocumentsDirectory();
  //   return directory?.path ?? '';
  // }

  @override
  Widget build(BuildContext context) {
    final base64 = Get.arguments[0];
    final imageBytes = base64Decode(base64);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Certificate"),
        leading: const BackButton(),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 54,
              ),
              Image.memory(base64Decode(base64)),
              const SizedBox(
                height: 34,
              ),
              ElevatedButton(
                  onPressed: () {
                    saveImageAsPdf(imageBytes);
                  },
                  child: Text(
                    'Download as PDF',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    saveImageToGallery(imageBytes);
                  },
                  child: Text(
                    'Download as PNG',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                    ),
                  )),
            ],
          )),
    );
  }
}
