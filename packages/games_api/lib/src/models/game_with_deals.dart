import 'package:equatable/equatable.dart';
import 'package:games_api/game_prices_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'game_with_deals.g.dart';

/// {@template game_with_deals}
/// A single `game` object with the current deals.
///
/// Contains an [info], a [cheapestPriceEver] and a [List] of [Deal]s.
/// {@endtemplate}
@immutable
@JsonSerializable()
class GameWithDeals extends Equatable {
  /// {@macro game_with_deals}
  const GameWithDeals({
    required this.info,
    required this.cheapestPriceEver,
    required this.deals,
  });

  /// Deserializes the given [JsonMap] into a [GameWithDeals]
  factory GameWithDeals.fromJson(JsonMap json) => _$GameWithDealsFromJson(json);

  /// Contains the basic information about the game.
  final Info info;

  /// The cheapest price ever for the game and the deal's id.
  final CheapestPriceEver cheapestPriceEver;

  /// A list of ongoing deals for the game.
  final List<Deal> deals;

  /// Converts this [GameWithDeals] into a [JsonMap]
  JsonMap toJson() => _$GameWithDealsToJson(this);

  @override
  List<Object> get props => [
        info,
        cheapestPriceEver,
        deals,
      ];
}

/// {@template info}
/// Contains the basic information about the game.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Info extends Equatable {
  /// {@macro info}
  const Info({
    required this.title,
    required this.thumb,
    this.steamAppID,
  });

  /// Deserializes the given [JsonMap] into a [Info]
  factory Info.fromJson(JsonMap json) => _$InfoFromJson(json);

  /// The title of the game.
  final String title;

  /// The unique identifier of the game on the Steam store, if there is any.
  final String? steamAppID;

  /// The uri of the game's thumbnail.
  final String thumb;

  /// Converts this [Info] into a [JsonMap]
  JsonMap toJson() => _$InfoToJson(this);

  @override
  List<Object?> get props => [title, steamAppID, thumb];
}

/// {@template cheapest_price_ever}
/// Contains the cheapest price ever for the game and the deal's id.
/// {@endtemplate}
@immutable
@JsonSerializable()
class CheapestPriceEver extends Equatable {
  /// {@macro cheapest_price_ever}
  const CheapestPriceEver({
    required this.price,
    required this.date,
  });

  /// Deserializes the given [JsonMap] into a [CheapestPriceEver]
  factory CheapestPriceEver.fromJson(JsonMap json) =>
      _$CheapestPriceEverFromJson(json);

  /// Converts this [CheapestPriceEver] into a [JsonMap]
  JsonMap toJson() => _$CheapestPriceEverToJson(this);

  /// The cheapest price ever recorded for the game.
  final String price;

  /// The date when the cheapest price was recorded in timestamps.
  final int date;

  @override
  List<Object> get props => [price, date];
}

/// {@template deal}
/// Contains the current price of the game, the retail price,
/// and the amount saved.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Deal extends Equatable {
  /// {@macro deal}
  const Deal({
    required this.storeID,
    required this.dealID,
    required this.price,
    required this.retailPrice,
    required this.savings,
  });

  /// Deserializes the given [JsonMap] into a [Deal]
  factory Deal.fromJson(JsonMap json) => _$DealFromJson(json);

  /// The unique identifier of the store.
  final String storeID;

  /// The unique identifier of the deal.
  final String dealID;

  /// The current price of the game.
  final String price;

  /// The retail price of the game.
  final String retailPrice;

  /// The amount saved by buying the game at the current price.
  final String savings;

  /// Converts this [Deal] into a [JsonMap]
  JsonMap toJson() => _$DealToJson(this);

  @override
  List<Object> get props => [storeID, dealID, price, retailPrice, savings];
}
