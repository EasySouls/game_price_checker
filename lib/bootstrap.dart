import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:game_price_checker/app/app.dart';
import 'package:games_api/game_prices_api.dart';
import 'package:games_repository/games_repository.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({required GamePricesApi gamePricesApi}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final gamesRepository = GamesRepository(
    gamePricesApi: gamePricesApi,
  );

  runZonedGuarded(
    () => {
      WidgetsFlutterBinding.ensureInitialized(),
      runApp(App(gamesRepository: gamesRepository))
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
