import 'dart:convert';

import 'package:games_api/game_prices_api.dart';
import 'package:http/http.dart' as http;

/// {@template cheapshark_games_api}
/// A Game Prices implementation using Cheapshark's API
/// {@endtemplate}
class CheapsharkGamesApi extends GamePricesApi {
  /// {@macro cheapshark_games_api}
  const CheapsharkGamesApi({required this.httpClient});

  /// The [http.Client] used to make requests.
  final http.Client httpClient;

  /// The base url for the Cheapshark API.
  static const baseUrl = 'www.cheapshark.com/api/1.0';

  @override
  Future<List<Game>> getGamesByTitle(String title) async {
    final response =
        await httpClient.get(Uri.https('$baseUrl/games?title=$title'));
    if (response.statusCode == 200) {
      final games = json.decode(response.body) as List;
      if (games.isEmpty) {
        throw GameNotFoundException(statusCode: response.statusCode);
      }

      return games.map((dynamic json) {
        final map = json as JsonMap;
        return Game.fromJson(map);
      }).toList();
    }

    throw GamePricesApiException(
      message: 'Failed to get games by title',
      statusCode: response.statusCode,
    );
  }
}
