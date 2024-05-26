import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_favorites_api/firestore_favorites_api.dart';
import 'package:flutter/widgets.dart';
import 'package:game_price_checker/app/app.dart';
import 'package:game_price_checker/firebase_options.dart';
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

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = const AppBlocObserver();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final firestoreFavoritesApi = FirestoreFavoritesApi();

      final gamesRepository = GamesRepository(
        gamePricesApi: gamePricesApi,
        firestoreFavoritesApi: firestoreFavoritesApi,
      );

      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;

      runApp(
        App(
          gamesRepository: gamesRepository,
          authenticationRepository: authenticationRepository,
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
