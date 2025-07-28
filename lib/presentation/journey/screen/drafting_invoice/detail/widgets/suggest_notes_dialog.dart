import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/di/injection/injection.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';
import '../../../warranty/bloc/warranty_bloc.dart';

class SuggestNotesDialog extends StatefulWidget {
  const SuggestNotesDialog({super.key, required this.callBack});

  final Function(Map<int, String> result) callBack;

  @override
  State<SuggestNotesDialog> createState() => _SuggestNotesDialogState();
}

class _SuggestNotesDialogState extends State<SuggestNotesDialog> {
  final WarrantyBloc _warrantyBloc = getIt.get<WarrantyBloc>();
  final TextEditingController _searchTextController = TextEditingController();

  Map<int, String> notesSelected = {};

  Timer? _searchTimer;

  @override
  void initState() {
    super.initState();
    notesSelected = {};
    _warrantyBloc.add(GetSuggestNoteEvent());
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _searchTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const HeaderDialog(title: 'Ghi chú bảo hành'),
          BoxSpacer.s8,
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: context.maxWidthDialog,
              ),
              child: Column(
                children: [
                  _searchBox(),
                  BoxSpacer.s16,
                  _notes(context),
                  BoxSpacer.s16,
                  XButton(
                    title: 'Xong',
                    onPressed: () => _onSubmit(context),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// WIDGET
  ///

  Widget _searchBox() {
    return XTextField(
      hintText: 'Nhập tìm kiếm ghi chú',
      onChanged: _onChangeText,
      controller: _searchTextController,
      suffixWidget: BlocBuilder<WarrantyBloc, WarrantyState>(
        bloc: _warrantyBloc,
        builder: (context, state) {
          if (state is UpdateIsLoading) {
            return const XLoading();
          }
          return Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.neutralColor,
          );
        },
      ),
    );
  }

  Widget _notes(BuildContext ctx) {
    return Expanded(
      child: BlocBuilder<WarrantyBloc, WarrantyState>(
        bloc: _warrantyBloc,
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final SuggestNoteModel note = state.warrantiesNote[index];
              final bool isSelected = notesSelected.containsKey(note.id);
              //
              return NoteItem(
                key: ValueKey(note.id),
                title: note.name ?? '',
                description: note.content ?? '',
                isSelected: isSelected,
                onTap: () => _onSelectNote(isSelected: isSelected, note: note),
              );
            },
            separatorBuilder: (context, index) => BoxSpacer.s16,
            itemCount: state.warrantiesNote.length,
          );
        },
      ),
    );
  }

  ///
  /// METHOD
  ///

  void _onChangeText(String? value) {
    if (_searchTimer?.isActive ?? false) _searchTimer?.cancel();
    _searchTimer = Timer(
        const Duration(milliseconds: AppConstants.timeSearchValue), () async {
      _warrantyBloc.add(SearchSuggestNoteEvent((value ?? '').trim()));
    });
  }

  void _onSelectNote({required SuggestNoteModel note, required isSelected}) {
    final key = note.id ?? -1;
    if (notesSelected.containsKey(key)) {
      notesSelected.remove(key);
    } else {
      notesSelected.putIfAbsent(
        key,
        () => note.content ?? '',
      );
    }
  }

  void _onSubmit(BuildContext ctx) {
    widget.callBack(notesSelected);
    Navigator.pop(context);
  }
}

class NoteItem extends StatefulWidget {
  const NoteItem(
      {super.key,
      required this.title,
      required this.description,
      required this.isSelected,
      required this.onTap});

  final String title;
  final String description;
  final bool isSelected;
  final Function() onTap;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  void initState() {
    isSelected.value = widget.isSelected;
    super.initState();
  }

  @override
  void dispose() {
    isSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: () {
        widget.onTap();
        isSelected.value = !isSelected.value;
      },
      child: ValueListenableBuilder(
          valueListenable: isSelected,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.title,
                style: AppFont.t.s().w800,
              ),
              BoxSpacer.s8,
              Text(
                widget.title,
                style: AppFont.t.s(),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          builder: (context, value, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
              decoration: BoxDecoration(
                color: value
                    ? AppColors.pinkLightColor
                    : AppColors.primaryLightColor,
                borderRadius: BorderRadius.all(AppRadius.l),
              ),
              child: child,
            );
          }),
    );
  }
}
