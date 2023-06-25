import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

Future<void> postImage(XFile file) async {
  final files = File(file.path);
  final Uint8List fileData = await file.readAsBytes();
  print("ตรงนี้นะ");
  print(file.readAsBytes());
  if (kIsWeb) {
    // await mountainsRef.putFile(files);
    // await mountainsRef.putFile(file);
    // await mountainsRef.putData(
    //   file.readAsBytes() as Uint8List,
    //   SettableMetadata(contentType: 'image/jpeg'),
    // );
  } else {
    // await mountainsRef.putFile(
    //     file,
    //     SettableMetadata(
    //       contentType: "image/*",
    //     ));
  }
}
