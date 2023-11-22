import 'package:dam_ii_final/models/book_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BooksResponse {
  final String? error;
  final String? total;
  final String? page;
  final List<BookResponse>? books;
  
  const BooksResponse({
    this.error,
    this.total,
    this.page,
    this.books
  });

  factory BooksResponse.fromJson(Map<String, dynamic> json) => _$BooksResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BooksResponseToJson(this);
}