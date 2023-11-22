// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksResponse _$BooksResponseFromJson(Map<String, dynamic> json) =>
    BooksResponse(
      error: json['error'] as String?,
      total: json['total'] as String?,
      page: json['page'] as String?,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => BookResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BooksResponseToJson(BooksResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'total': instance.total,
      'page': instance.page,
      'books': instance.books?.map((e) => e.toJson()).toList(),
    };
