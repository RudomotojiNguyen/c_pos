part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class GetCategoryEvent extends CategoryEvent {}
