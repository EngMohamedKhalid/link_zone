part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class InitialState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CategoriesState {
  @override
  List<Object> get props => [];
}
