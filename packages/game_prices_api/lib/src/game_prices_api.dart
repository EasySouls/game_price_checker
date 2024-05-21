import 'package:game_prices_api/src/models/game.dart';

/// {@template game_prices_api}
/// The interface and models for an API to access the game prices.
/// {@endtemplate}
abstract class GamePricesApi {
  /// {@macro game_prices_api}
  const GamePricesApi();

  /// Fetches a list of [Game]s by the given [title].
  Stream<List<Game>> getGamesByTitle(String title);
}

/// Error thrown when no [Game] with containing the given title is found.
class GameNotFoundException implements Exception {}
