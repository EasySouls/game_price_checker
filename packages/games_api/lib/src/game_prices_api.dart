import 'package:games_api/src/models/game.dart';

/// {@template game_prices_api}
/// The interface and models for an API to access the game prices.
/// {@endtemplate}
abstract class GamePricesApi {
  /// {@macro game_prices_api}
  const GamePricesApi();

  /// Fetches a list of [Game]s by the given [title].
  Future<List<Game>> getGamesByTitle(String title);
}

/// Error thrown when an error occurs in the [GamePricesApi].
class GamePricesApiException implements Exception {
  /// Creates a [GamePricesApiException] with the given [message]
  ///  and [statusCode].
  const GamePricesApiException({
    required this.message,
    required this.statusCode,
  });

  /// The message of the exception.
  final String message;

  /// The status code of the exception.
  final int statusCode;
}

/// Error thrown when no [Game] with containing the given title is found.
class GameNotFoundException extends GamePricesApiException {
  /// Creates a [GameNotFoundException] with the given [statusCode].
  GameNotFoundException({required super.statusCode})
      : super(
          message: 'Game not found',
        );
}
