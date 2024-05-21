import 'package:games_api/game_prices_api.dart';

/// {@template games_repository}
/// A repository that handles the games and the related actions
/// {@endtemplate}
class GamesRepository {
  /// {@macro games_repository}
  const GamesRepository({
    required GamePricesApi gamePricesApi,
  }) : _gamePricesApi = gamePricesApi;

  final GamePricesApi _gamePricesApi;

  /// Fetches a [List] of [Game]s by the given [title].
  Future<List<Game>> getGames({required String title}) async {
    final games = await _gamePricesApi.getGamesByTitle(title);
    return games;
  }
}
