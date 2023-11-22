// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
      error: json['error'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors: json['authors'] as String?,
      publisher: json['publisher'] as String?,
      language: json['language'] as String?,
      isbn10: json['isbn10'] as String?,
      isbn13: json['isbn13'] as String?,
      pages: json['pages'] as String?,
      year: json['year'] as String?,
      rating: json['rating'] as String?,
      desc: json['desc'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$BookResponseToJson(BookResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'language': instance.language,
      'isbn10': instance.isbn10,
      'isbn13': instance.isbn13,
      'pages': instance.pages,
      'year': instance.year,
      'rating': instance.rating,
      'desc': instance.desc,
      'price': instance.price,
      'image': instance.image,
      'url': instance.url,
    };
