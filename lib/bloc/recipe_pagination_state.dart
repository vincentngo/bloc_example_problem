part of 'recipe_pagination_bloc.dart';

class RecipePaginationState extends Equatable {

  final List<Recipe> recipes;

  RecipePaginationState(this.recipes);

  @override
  List<Object> get props => [recipes];
}
