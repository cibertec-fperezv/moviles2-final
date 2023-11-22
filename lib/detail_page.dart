import 'package:dam_ii_final/models/book_response.dart';
import 'package:dam_ii_final/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const textStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold
);

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.book
  });

  final BookResponse book;

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('TITLE', style: textStyle),
                    Text(widget.book.title ?? 'No title'),
                    const SizedBox(height: 20),
                    const Text('SUBTITLE', style: textStyle),
                    Text(widget.book.subtitle ?? 'No subtitle'),
                    const SizedBox(height: 20),
                    const Text('ISBN13', style: textStyle),
                    Text(widget.book.isbn13 ?? 'No isbn13'),
                    const SizedBox(height: 20),
                    const Text('PRICE', style: textStyle),
                    Text(widget.book.price ?? 'No price'),
                    const SizedBox(height: 20),
                    const Text('URL', style: textStyle),
                    Text(widget.book.url ?? 'No url'),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: deviceWidthPercentage(context, 50),
                        child: Image.network(widget.book.image ?? ''),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: CupertinoButton(
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
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}