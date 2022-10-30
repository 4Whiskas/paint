import 'package:flutter/material.dart';
import 'package:paint/presentation/screens/home/home_vm.dart';
import 'package:paint/presentation/widgets/app_icon_button.dart';
import 'package:stacked/stacked.dart';

class FilterTools extends ViewModelWidget<HomeViewModel> {
  const FilterTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.selectedImageBytes == null) return const SizedBox();
    return Positioned(
      top: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: ListView.separated(
          itemBuilder: (_, index) {
            final filter = viewModel.filters[index];
            if (filter.preview == null) return const SizedBox();
            return AppIconButton(
              onTap:()=> viewModel.filterImage(filter),
              iconWidget: SizedBox(
                height: 100,
                child: Image.memory(filter.preview!),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: viewModel.filters.length,
        ),
      ),
    );
  }
}
