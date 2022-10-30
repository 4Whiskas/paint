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
      bottom: 10 + MediaQuery.of(context).padding.bottom,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 16),
          DecoratedBox(
            decoration: BoxDecoration(
              color: ColorName.white.withOpacity(.7),
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
                          iconColor: viewModel.selectedTool == PaintTool.pencil
                              ? CupertinoColors.activeBlue
                              : ColorName.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: AppIconButton(
                          onTap: viewModel.selectBrush,
                          icon: Assets.icons.brush,
                          iconColor: viewModel.selectedTool == PaintTool.brush
                              ? CupertinoColors.activeBlue
                              : ColorName.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: AppIconButton(
                          onTap: viewModel.selectEraser,
                          icon: Assets.icons.eraser,
                          iconColor: viewModel.selectedTool == PaintTool.eraser
                              ? CupertinoColors.activeBlue
                              : ColorName.black,
                        ),
                      ),
                      const SizedBox(width: 5),
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
                      const SizedBox(width: 5),
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
                  if (viewModel.selectedImageBytes != null) ...[
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: AppIconButton(
                            onTap: viewModel.rotateImage,
                            icon: Assets.icons.rotate,
                            iconColor: ColorName.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: AppIconButton(
                            onTap: () => viewModel.flipImage(vertical: true),
                            icon: Assets.icons.fliph,
                            iconColor: ColorName.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: AppIconButton(
                            onTap: () => viewModel.flipImage(horizontal: true),
                            icon: Assets.icons.flipv,
                            iconColor: ColorName.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: AppIconButton(
                            icon: Assets.icons.crop,
                            onTap: viewModel.cropImage,
                            iconColor: ColorName.black,
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ),
          if (viewModel.selectedImageBytes != null) ...[
            const SizedBox(width: 10),
            DecoratedBox(
              decoration: BoxDecoration(
                color: ColorName.white.withOpacity(.7),
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
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: CupertinoSlider(
                            min: 1,
                            max: 300,
                            value: viewModel.selectedBrightness,
                            onChanged: viewModel.updateBrihtnessValue,
                            onChangeEnd: viewModel.changeBrightness,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: Assets.icons.brightness.svg(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: CupertinoSlider(
                            min: 1,
                            max: 300,
                            value: viewModel.selectedContrast,
                            onChanged: viewModel.updateContrastValue,
                            onChangeEnd: viewModel.changeContrast,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: Assets.icons.contrast.svg(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: CupertinoSlider(
                            min: -1000,
                            max: 1000,
                            value: viewModel.selectedSaturation,
                            onChanged: viewModel.updateSaturationValue,
                            onChangeEnd: viewModel.changeSaturation,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: Assets.icons.saturation.svg(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
