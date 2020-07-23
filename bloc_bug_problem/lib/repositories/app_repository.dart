import 'package:bloc_bug_problem/repositories/recipe_provider.dart';
import 'package:bloc_bug_problem/repositories/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


class AppRepository {
  final RecipeRepository recipeRepository;
  final String accountId;

  AppRepository({@required String accountId})
      : recipeRepository = _buildRecipeRepository(accountId),
        this.accountId = accountId;

  static RecipeRepository _buildRecipeRepository(String accountId) {
    return RecipeRepository(apiProvider: RecipeProvider(accountId: accountId));
  }

  /// RepositoryProviders to inject into our widget tree.
  List<RepositoryProvider> providers() {
    return [
      RepositoryProvider<RecipeRepository>(create: (context) => recipeRepository)
    ];
  }
}
