import 'package:cheapshark_games_api/cheapshark_games_api.dart';
import 'package:flutter/material.dart';
import 'package:game_price_checker/bootstrap.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final gamePricesApi = CheapsharkGamesApi(httpClient: http.Client());

  await bootstrap(gamePricesApi: gamePricesApi);
}
