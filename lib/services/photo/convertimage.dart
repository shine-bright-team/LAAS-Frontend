import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;

Future<Uint8List> convertImageToUint8List(ui.Image image) async {
  final ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}
