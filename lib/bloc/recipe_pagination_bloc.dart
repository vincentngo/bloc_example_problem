import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_bug_problem/repositories/recipe_repository.dart';
import 'package:equatable/equatable.dart';

part 'recipe_pagination_event.dart';
part 'recipe_pagination_state.dart';

class RecipePaginationBloc extends Bloc<RecipePaginationEvent, RecipePaginationState> {

  final RecipeRepository recipeRepository;

  RecipePaginationBloc(this.recipeRepository) : super(RecipePaginationState([]));

  @override
  Stream<RecipePaginationState> mapEventToState(
    RecipePaginationEvent event,
  ) async* {
    var recipes = await recipeRepository.getRecipes(1, "test");
    yield RecipePaginationState(recipes);
  }
}
