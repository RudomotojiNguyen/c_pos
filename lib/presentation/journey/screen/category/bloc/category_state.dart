part of 'category_bloc.dart';

@immutable
sealed class CategoryState extends Equatable {
  final List<CategoryModel> categories;

  const CategoryState({required this.categories});

  @override
  List<Object?> get props => [categories];
}

final class CategoryInitial extends CategoryState {
  const CategoryInitial({required super.categories});
}

final class GetCategorySuccess extends CategoryState {
  const GetCategorySuccess({
    required CategoryState state,
    required super.categories,
  });
}

final class UpdateLoading extends CategoryState {
  UpdateLoading({required CategoryState state})
      : super(categories: state.categories);
}
