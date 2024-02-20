import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int id;

  final String title;

  final double price;

  final String description;

  @JsonKey(name: 'image')
  final String imageUrl;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        imageUrl,
      ];

  @override
  String toString() {
    return 'id: $id\ntitle: $title\nprice: $price\ndescription: $description\nimage url: $imageUrl';
  }
}
