// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      gameID: json['gameID'] as String,
      cheapest: json['cheapest'] as String,
      name: json['external'] as String,
      cheapestDealID: json['cheapestDealID'] as String,
      thumb: json['thumb'] as String?,
      steamAppID: json['steamAppID'] as String?,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'gameID': instance.gameID,
      'steamAppID': instance.steamAppID,
      'cheapest': instance.cheapest,
      'cheapestDealID': instance.cheapestDealID,
      'external': instance.name,
      'thumb': instance.thumb,
    };
