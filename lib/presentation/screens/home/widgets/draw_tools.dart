import 'package:flutter/cupertino.dart';
import 'package:paint/gen/assets.gen.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/presentation/screens/home/enums/paint_tool.dart';
import 'package:paint/presentation/screens/home/home_vm.dart';
import 'package:paint/presentation/widgets/app_icon_button.dart';
import 'package:stacked/stacked.dart';

class DrawTools extends ViewModelWidget<HomeViewModel> {
  const DrawTools({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Positioned(
      bottom: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorName.white,
            boxShadow: [
              BoxShadow(
                color: ColorName.black.withOpacity(.2),
                blurRadius: 12,
                spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoSlider(
                  min: 1,
                  max: 50,
                  value: viewModel.selectedWidth,
                  onChanged: viewModel.setBrushWidth,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: AppIconButton(
                        onTap: viewModel.selectPencil,
                        icon: Assets.icons.pencil,
                        iconColor:
                            viewModel.selectedTool == PaintTool.pencil ? CupertinoColors.activeBlue : ColorName.black,
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: AppIconButton(
                        onTap: viewModel.selectBrush,
                        icon: Assets.icons.brush,
                        iconColor:
                            viewModel.selectedTool == PaintTool.brush ? CupertinoColors.activeBlue : ColorName.black,
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: AppIconButton(
                        onTap: viewModel.selectEraser,
                        icon: Assets.icons.eraser,
                        iconColor:
                            viewModel.selectedTool == PaintTool.eraser ? CupertinoColors.activeBlue : ColorName.black,
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: AppIconButton(
                        onTap: () => viewModel.setBrushColor(context),
                        iconWidget: SizedBox(
                          width: 32,
                          height: 32,
                          child: ColoredBox(color: viewModel.selectedColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: AppIconButton(
                        onTap: viewModel.onClearCanvas,
                        icon: Assets.icons.clear,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
