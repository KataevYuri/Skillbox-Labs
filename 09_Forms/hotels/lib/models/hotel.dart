import "package:json_annotation/json_annotation.dart";

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({this.uuid = "", this.name = "", this.poster = ""});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelDetail {
  final String uuid;
  final String name;
  final String poster;
  final Map<String, dynamic> address;
  final double price;
  final double rating;
  final Map<String, dynamic> services;
  final List<String> photos;

  HotelDetail(this.uuid, this.name, this.poster, this.address, this.price,
      this.rating, this.services, this.photos);

  factory HotelDetail.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailToJson(this);
}
