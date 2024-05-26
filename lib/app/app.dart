import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:game_price_checker/app/bloc/app_bloc.dart';
import 'package:game_price_checker/home/view/view.dart';
import 'package:game_price_checker/l10n/l10n.dart';
import 'package:game_price_checker/theme/theme.dart';
import 'package:games_repository/games_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.gamesRepository,
    required this.authenticationRepository,
    super.key,
  });

  final GamesRepository gamesRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationRepository),
        RepositoryProvider.value(value: gamesRepository),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterGamePricesTheme.light,
      darkTheme: FlutterGamePricesTheme.dark,
      title: 'Game Price Checker',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
