import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/home/view/view.dart';
import 'package:game_price_checker/l10n/l10n.dart';
import 'package:game_price_checker/theme/theme.dart';
import 'package:games_repository/games_repository.dart';

class App extends StatelessWidget {
  const App({required this.gamesRepository, super.key});

  final GamesRepository gamesRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: gamesRepository,
      child: const AppView(),
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
