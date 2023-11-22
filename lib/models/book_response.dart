import 'package:json_annotation/json_annotation.dart';

part 'book_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BookResponse {
  final String? error;
  final String? title;
  final String? subtitle;
  final String? authors;
  final String? publisher;
  final String? language;
  final String? isbn10;
  final String? isbn13;
  final String? pages;
  final String? year;
  final String? rating;
  final String? desc;
  final String? price;
  final String? image;
  final String? url;

  const BookResponse({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) => _$BookResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookResponseToJson(this);
}