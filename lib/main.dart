import 'package:bloc_bug_problem/bloc/recipe_pagination_bloc.dart';
import 'package:bloc_bug_problem/repositories/app_repository.dart';
import 'package:bloc_bug_problem/repositories/recipe_repository.dart';
import 'package:bloc_bug_problem/select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'account_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

// We can extend `BlocDelegate` and override `onTransition` and `onError`
// in order to handle transitions and errors from all Blocs.
class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountBloc>(create: (context) => AccountBloc()),
      ], 
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page')
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectBox(initialAccountId: "felix")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {

                var appRepository = AppRepository(accountId: state.selectedAccountId);

                return MultiRepositoryProvider(
                  providers: appRepository.providers(), 
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider<RecipePaginationBloc>(create: (context) => RecipePaginationBloc(RepositoryProvider.of<RecipeRepository>(context))),
                    ], 
                    child: MyRecipesScreen()
                )
              );
            })
          ],
        ),
      )
    );
  }
}

class MyRecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeBloc = context.bloc<RecipePaginationBloc>();
    print("the current account id is: ${recipeBloc.recipeRepository.accountId}");
    return Text("Account Id is currently : ${recipeBloc.recipeRepository.accountId}");
  }
}
