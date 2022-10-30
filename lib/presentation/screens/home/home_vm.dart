import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_editor/image_editor.dart';
import 'package:image_picker/image_picker.dart' as picker;
import 'package:paint/domain/services/error_service.dart';
import 'package:paint/domain/services/gallery_service.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/screens/home/dialogs/difference_dialog.dart';
import 'package:paint/presentation/screens/home/dialogs/select_image_source.dart';
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
  String? selectedImagePath;
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
    fillOptions();
    // drawingController
  }

  Future<void> pickImage(BuildContext context) async {
    final res = await showCupertinoDialog<picker.ImageSource>(
      context: context,
      barrierDismissible: true,
      builder: (context) => const SelectImageSource(),
    );
    if (res == null) return;
    final image = await picker.ImagePicker.platform.pickImage(source: res);
    if (image == null) return;
    selectedImagePath = image.path;
    final selectedImage = File(image.path);
    selectedImageBytes = await selectedImage.readAsBytes();
    originalImageBytes = selectedImageBytes;
    await fillFilters();
    resetImage();
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

  Future<void> saveToLocal(BuildContext context) async {
    await galleryService.saveImage(
      art: await drawingController.getImageData(),
    );
    Fluttertoast.showToast(msg: LocaleKeys.saveSuccess.tr());
  }

  Future<void> showDifference(BuildContext context) async {
    if (originalImageBytes == null) {
      errorService.showEror();
      return;
    }
    final after = await drawingController.getImageData();
    final afterBytes = after?.buffer.asUint8List();
    if (afterBytes == null) {
      errorService.showEror();
      return;
    }
    await showCupertinoDialog(
      context: context,
      builder: (context) => DifferenceDialog(
        before: originalImageBytes!,
        after: afterBytes,
      ),
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
    contrastOption = ColorOption.contrast(value / 100);
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
    final editedImage = originalImageBytes!;
    selectedImageBytes = await ImageEditor.editImage(
      image: editedImage,
      imageEditorOption: selectedOptions,
    );
    notifyListeners();
  }

  void resetImage() {
    selectedBrightness = 100;
    selectedSaturation = 100;
    selectedContrast = 100;
    filterOption = ColorOption();
    brightnessOption = ColorOption();
    contrastOption = ColorOption();
    saturationOption = ColorOption();
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

  Future<void> cropImage() async {
    if (selectedImagePath == null) {
      errorService.showEror();
      return;
    }
    final res = await ImageCropper().cropImage(
      sourcePath: selectedImagePath!,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: LocaleKeys.cropper.tr(),
            toolbarColor: ColorName.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: LocaleKeys.cropper.tr(),
        ),
      ],
    );
    if (res == null) return;
    selectedImageBytes = await res.readAsBytes();
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

  @override
  void dispose() {
    drawingController.dispose();
    super.dispose();
  }
}
