// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) => HotelPreview(
      uuid: json['uuid'] as String? ?? "",
      name: json['name'] as String? ?? "",
      poster: json['poster'] as String? ?? "",
    );

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

HotelDetail _$HotelDetailFromJson(Map<String, dynamic> json) => HotelDetail(
      json['uuid'] as String,
      json['name'] as String,
      json['poster'] as String,
      json['address'] as Map<String, dynamic>,
      (json['price'] as num).toDouble(),
      (json['rating'] as num).toDouble(),
      json['services'] as Map<String, dynamic>,
      (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelDetailToJson(HotelDetail instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };
