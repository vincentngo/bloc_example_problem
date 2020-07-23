
import 'package:bloc_bug_problem/repositories/recipe_repository.dart';
import 'package:meta/meta.dart';

@immutable
class RecipeProvider {
  final String accountId;

  RecipeProvider({@required accountId}) : this.accountId = accountId;

  Future<List<Recipe>> getRecipes(int currentPage, String searchQuery) async {
    return [
      Recipe("1", "TestRecipe", true),
      Recipe("2", "TestRecipe2", true),
      Recipe("3", "TestRecipe3", true)
    ];
  }
}