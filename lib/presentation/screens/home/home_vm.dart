import 'dart:async';
import 'dart:io';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/presentation/screens/home/enums/paint_tool.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

import 'dialogs/select_color_dialog.dart';

class HomeViewModel extends BaseViewModel {
  final DrawingController drawingController = DrawingController();
  Color selectedColor = ColorName.black;
  String? selectedImagePath;
  File? selectedImage;
  Uint8List? selectedImageBytes;

  PaintTool selectedTool = PaintTool.pencil;
  double selectedWidth = 2;

  Future<void> onReady() async {
    //drawingController.currentContent.draw(Canvas(), size, deeper)
    drawingController.setStyle(
      color: selectedColor,
      strokeWidth: selectedWidth,
    );
    
  }

  Future<void> pickImage(BuildContext context) async {
    var configs = ImagePickerConfigs();
    configs.appBarTextColor = Colors.black;
    configs.stickerFeatureEnabled = false;
    configs.translateFunc = (name, value) => Intl.message(
          value,
          name: name,
        );
    List<ImageObject> objects = await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, __) {
          return ImagePicker(
            maxCount: 1,
            configs: configs,
          );
        },
      ),
    );

    selectedImagePath = objects.first.originalPath;
    selectedImage = File(objects.first.modifiedPath);
    selectedImageBytes = await selectedImage!.readAsBytes();
    notifyListeners();
  }

  Future<void> setBrushColor(BuildContext context) async {
    final res = await showCupertinoDialog<Color>(
      context: context,
      builder: (context) => SelectColorDialog(inputColor: selectedColor),
    );
    if (res == null) return;
    drawingController.setStyle(color: res);
    selectedColor = res;
    notifyListeners();
  }

  Future<void> saveToLocal() async {
    final drawingBytes = (await drawingController.getImageData())!.buffer.asUint8List();
    Uint8List newImage = Uint8List.fromList([
      ...drawingBytes,
      ...selectedImageBytes ?? [],
    ]);
    final dir = await getExternalStorageDirectory();
    if (dir == null) return;
    const uuid = Uuid();
    final file = File('${dir.path}${uuid.v4()}.jpg');
    await file.writeAsBytes(newImage);
  }

  Future<void> saveToHive() async {}

  void rollBack() => drawingController.undo();
  void rollForward() => drawingController.redo();
  void selectPencil() {
    drawingController.setPaintContent = SimpleLine();
    selectedTool = PaintTool.pencil;
    notifyListeners();
  }

  void selectBrush() {
    drawingController.setPaintContent = SmoothLine();
    selectedTool = PaintTool.brush;
    notifyListeners();
  }

  void selectEraser() {
    drawingController.setPaintContent = Eraser(color: Colors.white);
    selectedTool = PaintTool.eraser;
    notifyListeners();
  }

  void setBrushWidth(double width) {
    drawingController.setStyle(strokeWidth: width);
    selectedWidth = width;
    notifyListeners();
  }

  void onClearCanvas() {
    drawingController.clear();
  }
}
