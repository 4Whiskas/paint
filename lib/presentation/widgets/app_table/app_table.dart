import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_button.dart';
import 'package:template/presentation/widgets/app_card.dart';

import 'abstract/searched_table_item.dart';
import 'models/app_table_element.dart';
import 'models/app_table_filter.dart';

class AppTable extends StatefulWidget {
  const AppTable({
    Key? key,
    required this.foundedTitle,
    required this.data,
    required this.rowsInPageCount,
    required this.headers,
    required this.showFilters,
    required this.showSorts,
    required this.clearFilters,
    required this.selectedFilters,
    required this.clearFilter,
    this.small = false,
    this.smallTableName,
    this.withAddButton = false,
    this.addAction,
    this.addTitle,
  }) : super(key: key);

  final String foundedTitle;
  final List<AppTableElement> headers;
  final List<List<AppTableElement>> data;
  final int rowsInPageCount;
  final VoidCallback showFilters;
  final VoidCallback showSorts;
  final VoidCallback clearFilters;
  final Function(String) clearFilter;
  final List<AppTableFilter> selectedFilters;
  final bool small;
  final bool withAddButton;
  final VoidCallback? addAction;
  final String? addTitle;
  final String? smallTableName;

  @override
  State<AppTable> createState() => _AppTableState();
}

class _AppTableState extends State<AppTable> {
  int currentPage = 1;
  TextEditingController searchController = TextEditingController();

  List<List<AppTableElement>> get searchData {
    if (searchController.text.isEmpty) {
      return widget.data;
    }
    List<List<AppTableElement>> searchedData = [];
    for (final data in widget.data) {
      if (searchInRows(data)) {
        searchedData.add(data);
      }
    }
    return searchedData;
  }

  int get pagesCount {
    int length = searchData.length ~/ widget.rowsInPageCount;
    if (searchData.length / widget.rowsInPageCount != 0) {
      length++;
    }
    return length;
  }

  List<AppTableFilter> get activeFilters =>
      widget.selectedFilters.where((filter) => filter.active == true).toList();

  int get itemsCount => searchData.length;

  List<List<AppTableElement>> get currentPageRows {
    final allRows = searchData;
    List<List<AppTableElement>> currentPageData = [];
    for (int i = 0; i < searchData.length; i++) {
      if ((i > (currentPage - 2) * widget.rowsInPageCount &&
              i < (currentPage - 1) * widget.rowsInPageCount) ||
          currentPage == 1 && i < (widget.rowsInPageCount - 1)) {
        currentPageData.add(allRows[i]);
      }
    }
    return currentPageData;
  }

  List<AppTableElement> get headers => widget.headers;

  void startSearch() {
    setState(() {
      currentPage = 1;
    });
  }

  bool searchInRows(List<AppTableElement> data) {
    for (final dataItem in data) {
      if (dataItem.child is SearchedTableItem) {
        final title = (dataItem.child as SearchedTableItem).title.toLowerCase();
        final controllersText = searchController.text.toLowerCase();
        if (title.contains(controllersText)) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectableRegion(
      focusNode: FocusNode(),
      selectionControls: cupertinoDesktopTextSelectionControls,
      child: Column(
        children: [
          if (!widget.small && !widget.withAddButton) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110,
                  height: 50,
                  child: AppButton(
                    onTap: widget.showFilters,
                    text: 'Фильтр',
                    icon: Assets.icons.filter,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 272,
                      child: CupertinoSearchTextField(
                        controller: searchController,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: 44,
                      height: 48,
                      child: CupertinoButton(
                        onPressed: startSearch,
                        color: ColorName.blue,
                        padding: EdgeInsets.zero,
                        minSize: 0,
                        borderRadius: BorderRadius.circular(4),
                        child: const Icon(CupertinoIcons.search),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
          AppCard(
            child: Column(
              children: [
                if (!widget.small && !widget.withAddButton) ...[
                  if (activeFilters.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 420,
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: activeFilters
                                .map(
                                  (e) => DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: ColorName.lightGrey,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(e.actualTitle),
                                          const SizedBox(width: 9),
                                          SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              minSize: 0,
                                              onPressed: () =>
                                                  widget.clearFilter(e.id),
                                              child: const Icon(
                                                Icons.clear,
                                                size: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(
                          width: 118,
                          height: 48,
                          child: CupertinoButton(
                            onPressed: () => widget.clearFilters(),
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            color: ColorName.lightGrey,
                            child: Text(
                              'Сбросить всё',
                              style: AppTypography.sf.s16.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.smallTableName == null)
                      Row(
                        children: [
                          Text(
                            widget.foundedTitle,
                            style: AppTypography.sf.w400.s14,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            itemsCount.toString(),
                            style: AppTypography.sf.w600.s14,
                          ),
                        ],
                      )
                    else
                      Text(
                        widget.smallTableName!,
                        style: AppTypography.sf.w600.s16,
                      ),
                    if (widget.addAction == null)
                      SizedBox(
                        width: 160,
                        child: GestureDetector(
                          onTap: widget.showSorts,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Text(
                                  'Сортировать по',
                                  style: AppTypography.sf.w400.s14,
                                ),
                              ),
                              Assets.icons.dropdownArrow.svg(),
                            ],
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        width: 168,
                        height: 48,
                        child: CupertinoButton(
                          onPressed: widget.addAction,
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          color: ColorName.blue,
                          borderRadius: BorderRadius.circular(4),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: ColorName.black,
                                ),
                                const SizedBox(width: 11),
                                Text(
                                  widget.addTitle ?? 'Добавить',
                                  style: AppTypography.sf.w500.s14
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: ColorName.grey,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (final header in widget.headers)
                          Expanded(
                            flex: header.flex,
                            child: header.child,
                          ),
                      ],
                    ),
                  ),
                ),
                for (final dataRow in currentPageRows)
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorName.lightGrey,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < dataRow.length; i++)
                            Expanded(
                              flex: dataRow[i].flex,
                              child: dataRow[i].child,
                            ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: currentPage < 2
                          ? null
                          : () {
                              setState(() {
                                currentPage--;
                              });
                            },
                      child: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    const SizedBox(width: 17),
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorName.lightGrey,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            currentPage.toString(),
                            style: AppTypography.sf.w600.s14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      child: Center(
                        child: Text(
                          '/',
                          style: AppTypography.sf.w600.s14,
                        ),
                      ),
                    ),
                    Text(
                      pagesCount.toString(),
                      style: AppTypography.sf.w600.s14,
                    ),
                    const SizedBox(width: 17),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: currentPage >= pagesCount
                          ? null
                          : () {
                              setState(() {
                                currentPage++;
                              });
                            },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
