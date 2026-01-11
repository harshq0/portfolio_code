import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:universal_html/html.dart' as html;

Future<void> downloadResume() async {
  if (kIsWeb) {
    // Web implementation
    html.AnchorElement anchorElement =
        html.AnchorElement(href: 'assets/harish_resume.pdf');
    anchorElement.download = "Harish_Resume.pdf";
    anchorElement.click();
  } else {
    // Native implementation (Android, iOS, Windows, etc.)
    try {
      final byteData = await rootBundle.load('assets/harish_resume.pdf');
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/Harish_Resume.pdf');

      await file.writeAsBytes(byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      ));

      await OpenFile.open(file.path);
    } catch (e) {
      debugPrint('Error downloading resume: $e');
    }
  }
}
