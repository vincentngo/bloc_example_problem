

import 'package:meta/meta.dart';

import 'recipe_provider.dart';


class Recipe {
  final String accountId;
  final String title;
  final bool isVegan;

  Recipe(this.accountId, this.title, this.isVegan);
}

@immutable
class RecipeRepository {
  final RecipeProvider apiProvider;

  RecipeRepository({@required apiProvider}) : apiProvider = apiProvider;

  String get accountId => apiProvider.accountId;
  
  Future<List<Recipe>> getRecipes(int currentPage, String queryString) async {
    var recipes = await apiProvider.getRecipes(currentPage, queryString);
    return recipes;
  }
}

