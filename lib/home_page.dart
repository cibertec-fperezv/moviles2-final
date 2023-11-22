import 'dart:convert';

import 'package:dam_ii_final/detail_page.dart';
import 'package:dam_ii_final/models/book_response.dart';
import 'package:dam_ii_final/models/books_response.dart';
import 'package:dam_ii_final/search_page.dart';
import 'package:dam_ii_final/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final books = List<BookResponse>.empty(growable: true);
  
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: CupertinoButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const SearchPage())
                  );
                },
                child: const Text(
                  'CONSULTA LIBRO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
              child: SizedBox(
                child: Row(
                  children: [
                    const Text('Libro:'),
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
                        http.get(Uri.parse('https://api.itbook.store/1.0/search/${searchController.text}')).then((response) {
                          
                          final booksResponse = BooksResponse.fromJson(jsonDecode(response.body));
                          
                          if ((booksResponse.books?.length ?? 0) > 0) {
                            setState(() {
                              books.clear();
                              booksResponse.books?.forEach((book) =>
                                  books.add(book));
                            });
                          } else {
                            showCupertinoDialog(
                                context: context, 
                                builder: (context) => CupertinoAlertDialog(
                                  title: Text('El libro no existe'),
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cerrar'),
                                    ),
                                  ]
                                )
                            );
                          }
                        });
                      }
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: books.indexed
                    .map((entry) => (book: entry.$2, index: entry.$1))
                    .map((entry) {

                      final index = entry.index;
                      final booksSize = books.length - 1;

                      final isAtRight = index.isOdd;
                      final isAtLeft = index.isEven;
                      final isAtTheBegin = index < 2;
                      final isAtTheEnd = (booksSize.isOdd && (index == booksSize || index == booksSize - 1)) ||
                          (booksSize.isEven && index == booksSize);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => DetailPage(book: entry.book))
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                              right: isAtRight ? 20 : 10,
                              left: isAtLeft ? 20 : 10,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xFF000000)),
                                      ),
                                      child: SizedBox(
                                          height: deviceWidthPercentage(context, 35),
                                          child: Image.network(entry.book.image ?? 'no-image')
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  entry.book.title ?? 'No title',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF676767),
                                  ),
                                  textAlign: TextAlign.center,
                                  // maxLines: 1,
                                ),
                              ],
                            )
                        ),
                      );
                    }).toList()
              ),
            )
          ],
        )
      )
    );
  }
}
