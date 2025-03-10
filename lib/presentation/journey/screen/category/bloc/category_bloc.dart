import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/category_model.dart';
import '../../../../../data/repository/category_repository.dart';
import '../../../../mixins/logger_helper.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  final LoggerHelper loggerHelper = LoggerHelper();

  CategoryBloc({required this.categoryRepository})
      : super(const CategoryInitial(categories: [])) {
    on<GetCategoryEvent>(_onGetCategory);
  }

  FutureOr<void> _onGetCategory(
      GetCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(UpdateLoading(state: state));
      final res = await categoryRepository.getAllInternalCategory();
      emit(GetCategorySuccess(state: state, categories: res));
    } catch (e) {
      loggerHelper.logError(message: 'GetCategory', obj: e);
    }
  }

  Future<List<CategoryModel>> suggestionsCallback(String pattern) async {
    return state.categories.where((cate) {
      final nameLower =
          cate.getCategoryName.toLowerCase().removeUtf8.split(' ').join('');
      final patternLower = pattern.toLowerCase().removeUtf8.split(' ').join('');
      return nameLower.contains(patternLower);
    }).toList();
  }
}
