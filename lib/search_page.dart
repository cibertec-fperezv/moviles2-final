import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_ii_final/models/book_response.dart';
import 'package:dam_ii_final/ui_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const textStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final searchController = TextEditingController();

  BookResponse? book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CupertinoPageScaffold(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Text('Ingresar ISBN13:'),
                        const SizedBox(width: 10),
                        Expanded(
                            child: CupertinoTextField(
                              controller: searchController,
                            )
                        ),
                        const SizedBox(width: 10),
                        CupertinoButton(
                            child: const Text('Buscar'),
                            onPressed: () {
                              http.get(Uri.parse('https://api.itbook.store/1.0/books/${searchController.text}')).then((response) {
                                setState(() {
                                  book = BookResponse.fromJson(jsonDecode(response.body));

                                  existsBook(book!).then((optionalBook) {
                                    if (optionalBook.size == 0) {
                                      addBook(book!);
                                    }
                                  });
                                });
                              });
                            }
                        )
                      ],
                    ),
                  ),
                ),
                book != null ?
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text('TITLE', style: textStyle),
                          Text(book!.title ?? 'No title'),
                          const SizedBox(height: 20),
                          const Text('SUBTITLE', style: textStyle),
                          Text(book!.subtitle ?? 'No subtitle'),
                          const SizedBox(height: 20),
                          const Text('ISBN13', style: textStyle),
                          Text(book!.isbn13 ?? 'No isbn13'),
                          const SizedBox(height: 20),
                          const Text('PRICE', style: textStyle),
                          Text(book!.price ?? 'No price'),
                          const SizedBox(height: 20),
                          const Text('URL', style: textStyle),
                          Text(book!.url ?? 'No url'),
                          const SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              width: deviceWidthPercentage(context, 50),
                              child: Image.network(book!.image ?? ''),
                            ),
                          ),
                          const SizedBox(height: 20)
                        ],
                      ),
                    )
                  ) : Container(),
                CupertinoButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Volver',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    )
                ),
                const SizedBox(height: 15),
              ],
            )
        )
    );
  }

  CollectionReference booksCollection = FirebaseFirestore.instance.collection('books');

  Future<void> addBook(BookResponse book) {
    // Call the user's CollectionReference to add a new user
    return booksCollection
        .add(book.toJson())
        .then((value) => print("Book Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<QuerySnapshot<Object?>> existsBook(BookResponse book) {
    return booksCollection.where('title', isEqualTo: book.title).get();
  }
}