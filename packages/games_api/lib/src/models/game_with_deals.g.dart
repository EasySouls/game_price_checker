// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_with_deals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameWithDeals _$GameWithDealsFromJson(Map<String, dynamic> json) =>
    GameWithDeals(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      cheapestPriceEver: CheapestPriceEver.fromJson(
        json['cheapestPriceEver'] as Map<String, dynamic>,
      ),
      deals: (json['deals'] as List<dynamic>)
          .map((e) => Deal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameWithDealsToJson(GameWithDeals instance) =>
    <String, dynamic>{
      'info': instance.info,
      'cheapestPriceEver': instance.cheapestPriceEver,
      'deals': instance.deals,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      title: json['title'] as String,
      thumb: json['thumb'] as String,
      steamAppID: json['steamAppID'] as String?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'title': instance.title,
      'steamAppID': instance.steamAppID,
      'thumb': instance.thumb,
    };

CheapestPriceEver _$CheapestPriceEverFromJson(Map<String, dynamic> json) =>
    CheapestPriceEver(
      price: json['price'] as String,
      date: (json['date'] as num).toInt(),
    );

Map<String, dynamic> _$CheapestPriceEverToJson(CheapestPriceEver instance) =>
    <String, dynamic>{
      'price': instance.price,
      'date': instance.date,
    };

Deal _$DealFromJson(Map<String, dynamic> json) => Deal(
      storeID: json['storeID'] as String,
      dealID: json['dealID'] as String,
      price: json['price'] as String,
      retailPrice: json['retailPrice'] as String,
      savings: json['savings'] as String,
    );

Map<String, dynamic> _$DealToJson(Deal instance) => <String, dynamic>{
      'storeID': instance.storeID,
      'dealID': instance.dealID,
      'price': instance.price,
      'retailPrice': instance.retailPrice,
      'savings': instance.savings,
    };
