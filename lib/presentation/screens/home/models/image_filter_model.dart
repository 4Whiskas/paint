import 'package:flutter/foundation.dart';
import 'package:image_editor/image_editor.dart';

class ImageFilterModel {
  ImageFilterModel({
    required this.filter,
    required this.preview,
  });
  final Option filter;
  final Uint8List? preview;
}
