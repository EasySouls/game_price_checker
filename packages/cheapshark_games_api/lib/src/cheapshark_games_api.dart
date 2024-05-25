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
  static const baseUrl = 'www.cheapshark.com';

  @override
  Future<List<Game>> getGamesByTitle(String title) async {
    final response = await httpClient
        .get(Uri.https(baseUrl, '/api/1.0/games', {'title': title}));
    if (response.statusCode == 200) {
      final games = json.decode(response.body) as List;
      if (games.isEmpty) {
        throw GameNotFoundException(statusCode: response.statusCode);
      }

      return games.map((dynamic json) {
        final map = json as JsonMap;
        if (map.isEmpty) {
          throw GamePricesApiException(
            message: 'Failed to get games by title',
            statusCode: response.statusCode,
          );
        }
        return Game.fromJson(map);
      }).toList();
    }

    throw GamePricesApiException(
      message: 'Failed to get games by title',
      statusCode: response.statusCode,
    );
  }

  @override
  Future<Game> getGameById(String id) async {
    final response =
        await httpClient.get(Uri.https(baseUrl, '/api/1.0/games', {'id': id}));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as JsonMap;
      if (data.isEmpty) {
        throw GameNotFoundException(statusCode: response.statusCode);
      }
      // We only need the id, title and the cheapest price, since that's all
      // we use on the favorites page.
      final gameWithDeals = GameWithDeals.fromJson(data);
      var cheapest = gameWithDeals.deals.first.price;
      var cheapestDealID = gameWithDeals.deals.first.dealID;
      for (final deal in gameWithDeals.deals) {
        if (double.parse(deal.price) < double.parse(cheapest)) {
          cheapest = deal.price;
          cheapestDealID = deal.dealID;
        }
      }
      return Game(
        gameID: id,
        steamAppID: gameWithDeals.info.steamAppID,
        name: gameWithDeals.info.title,
        cheapest: cheapest,
        cheapestDealID: cheapestDealID,
        thumb: gameWithDeals.info.thumb,
      );
    }

    throw GamePricesApiException(
      message: 'Failed to get game by id',
      statusCode: response.statusCode,
    );
  }
}
