import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:stacked/stacked.dart';
import 'package:paint/presentation/screens/home/home_vm.dart';

class DrawView extends ViewModelWidget<HomeViewModel> {
  const DrawView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return DrawingBoard(
      onPanStart: (dsd) {},
      onPanEnd: (ded) {},
      onPanUpdate: (dud) {},
      background: viewModel.selectedImage == null
          ? Container(width: 400, height: 400, color: Colors.white)
          : Image.file(viewModel.selectedImage!,),
      controller: viewModel.drawingController,
    );
  }
}
