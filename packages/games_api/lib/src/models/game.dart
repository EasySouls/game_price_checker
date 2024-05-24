import 'package:equatable/equatable.dart';
import 'package:games_api/src/models/json_map.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'game.g.dart';

/// {@template game}
/// A single `game` object.
///
/// Contains a [gameID], [steamAppID], [cheapest], [cheapestDealID],
/// [name], and [thumb].
/// {@endtemplate}
@immutable
@JsonSerializable()
class Game extends Equatable {
  /// {@macro game}
  const Game({
    required this.gameID,
    required this.cheapest,
    required this.name,
    required this.cheapestDealID,
    this.thumb,
    this.steamAppID,
  });

  /// Deserializes the given [JsonMap] into a [Game]
  factory Game.fromJson(JsonMap json) => _$GameFromJson(json);

  /// The unique identifier of the `game`
  final String gameID;

  /// The unique identifier of the `game` on the Steam store
  final String? steamAppID;

  /// The current cheapest price of the `game`
  final String cheapest;

  /// The unique id of the deal that is currently the cheapest
  final String cheapestDealID;

  /// The name of the `game`
  @JsonKey(name: 'external')
  final String name;

  /// The uri of the `game`'s thumbnail
  final String? thumb;

  /// Converts this [Game] into a [JsonMap]
  JsonMap toJson() => _$GameToJson(this);

  @override
  List<Object> get props => [
        gameID,
        cheapest,
        cheapestDealID,
        name,
      ];
}
