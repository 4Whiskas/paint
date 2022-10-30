import 'dart:async';
import 'dart:io';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:image_editor/image_editor.dart';
import 'package:paint/domain/services/error_service.dart';
import 'package:paint/domain/services/gallery_service.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/presentation/screens/home/enums/paint_tool.dart';
import 'package:stacked/stacked.dart';

import 'dialogs/select_color_dialog.dart';
import 'models/image_filter_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required this.galleryService,
    required this.errorService,
  });

  final GalleryService galleryService;
  final ErrorService errorService;

  final DrawingController drawingController = DrawingController();

  final configs = ImagePickerConfigs();
  final selectedOptions = ImageEditorOption();

  Option filterOption = ColorOption();
  Option brightnessOption = ColorOption();
  Option contrastOption = ColorOption();
  Option saturationOption = ColorOption();

  Option clearOption = ColorOption();
  Option greenBlueOption = ColorOption();
  Option redBlueOption = ColorOption();
  Option redGreenOption = ColorOption();
  Option redOption = ColorOption();
  Option greenOption = ColorOption();
  Option blueOption = ColorOption();
  Color selectedColor = ColorName.black;
  Uint8List? selectedImageBytes;
  Uint8List? originalImageBytes;
  List<ImageFilterModel> filters = [];
  PaintTool selectedTool = PaintTool.pencil;
  double selectedWidth = 2;
  double selectedBrightness = 100;
  double selectedContrast = 100;
  double selectedSaturation = 100;

  Future<void> onReady() async {
    drawingController.setStyle(
      color: selectedColor,
      strokeWidth: selectedWidth,
    );
    initImagePickerConfigs();
    fillOptions();
    // drawingController
  }

  Future<void> pickImage(BuildContext context) async {
    final res = await Navigator.of(context).push<List<ImageObject>>(
      PageRouteBuilder(
        pageBuilder: (context, animation, __) {
          return ImagePicker(
            maxCount: 1,
            configs: configs,
          );
        },
      ),
    );
    if (res == null) return;

    final selectedImage = File(res.first.modifiedPath);
    selectedImageBytes = await selectedImage.readAsBytes();
    originalImageBytes = selectedImageBytes;
    await fillFilters();
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
    await galleryService.saveImage(
      art: await drawingController.getImageData(),
    );
  }

  Future<void> saveToHive() async {}

  void initImagePickerConfigs() {
    configs.appBarTextColor = Colors.black;
    configs.stickerFeatureEnabled = false;
    configs.translateFunc = (name, value) => Intl.message(
          value,
          name: name,
        );
  }

  void fillOptions() {
    clearOption = ColorOption();
    greenBlueOption = ColorOption(
      matrix: [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1],
    );
    redBlueOption = ColorOption(
      matrix: [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1],
    );
    redGreenOption = ColorOption(
      matrix: [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1],
    );
    redOption = ColorOption(
      matrix: [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1],
    );
    blueOption = ColorOption(
      matrix: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1],
    );
    greenOption = ColorOption(
      matrix: [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1],
    );
  }

  Future<void> fillFilters() async {
    filters.clear();
    if (selectedImageBytes == null) {
      errorService.showEror();
      return;
    }
    for (final option in <Option>[
      clearOption,
      greenBlueOption,
      redBlueOption,
      redGreenOption,
      redOption,
      blueOption,
      greenOption
    ]) {
      final gOpt = ImageEditorOption();
      gOpt.addOption(option);
      final preview = await ImageEditor.editImage(
        image: selectedImageBytes!,
        imageEditorOption: gOpt,
      );
      filters.add(ImageFilterModel(filter: option, preview: preview));
    }
  }

  Future<void> changeContrast(double value) async {
    if (selectedImageBytes == null) {
      errorService.showEror();
      return;
    }
    contrastOption = ColorOption.contrast(value/100);
    await updateImage();
  }

  Future<void> changeBrightness(double value) async {
    if (selectedImageBytes == null) {
      errorService.showEror();
      return;
    }
    brightnessOption = ColorOption.brightness(value / 100);
    await updateImage();
  }

  Future<void> changeSaturation(double value) async {
    if (selectedImageBytes == null) {
      errorService.showEror();
      return;
    }
    saturationOption = ColorOption.saturation(value / 100);
    await updateImage();
  }

  Future<void> filterImage(ImageFilterModel filter) async {
    if (selectedImageBytes == null || filters.first.preview == null) {
      errorService.showEror();
      return;
    }
    filterOption = filter.filter;
    await updateImage();
  }

  Future<void> updateImage() async {
    if (originalImageBytes == null) {
      errorService.showEror();
      return;
    }
    selectedOptions.reset();
    selectedOptions.addOptions(
      [
        filterOption,
        contrastOption,
        brightnessOption,
        saturationOption,
      ],
    );
    selectedImageBytes = await ImageEditor.editImage(
      image: originalImageBytes!,
      imageEditorOption: selectedOptions,
    );
    notifyListeners();
  }

  void resetImage(){
    selectedBrightness = 100;
    selectedSaturation = 100;
    selectedContrast = 100;
    selectedImageBytes = originalImageBytes;
    notifyListeners();
  }

  void updateContrastValue(double value) async {
    selectedContrast = value;
    notifyListeners();
  }

  void updateBrihtnessValue(double value) async {
    selectedBrightness = value;
    notifyListeners();
  }

  void updateSaturationValue(double value) async {
    selectedSaturation = value;
    notifyListeners();
  }

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

  Future<void> rotateImage() async {
    if (selectedImageBytes == null) return;
    final options = ImageEditorOption();
    options.addOption(const RotateOption(90));
    selectedImageBytes = await ImageEditor.editImage(
      image: selectedImageBytes!,
      imageEditorOption: options,
    );
    notifyListeners();
  }

  Future<void> flipImage({bool horizontal = false, bool vertical = false}) async {
    if (selectedImageBytes == null) return;
    final options = ImageEditorOption();
    options.addOption(
      FlipOption(
        horizontal: horizontal,
        vertical: vertical,
      ),
    );
    selectedImageBytes = await ImageEditor.editImage(
      image: selectedImageBytes!,
      imageEditorOption: options,
    );
    notifyListeners();
  }

  void onClearCanvas() {
    drawingController.clear();
  }
}
