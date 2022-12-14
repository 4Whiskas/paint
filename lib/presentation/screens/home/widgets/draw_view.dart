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
      background: viewModel.selectedImageBytes == null
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: Colors.white,
            )
          : Image.memory(
              viewModel.selectedImageBytes!,
            ),
      controller: viewModel.drawingController,
    );
  }
}
