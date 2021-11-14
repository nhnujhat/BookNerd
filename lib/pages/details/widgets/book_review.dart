import 'package:book_nerd/constants/colors.dart';
import 'package:book_nerd/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';
import 'package:book_nerd/api/pdf_api.dart';
import 'package:book_nerd/pages/pdf_viewer_page.dart';

class BookReview extends StatelessWidget {
  final Book book;
  const BookReview(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${book.score}',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              RatingBarIndicator(
                rating: book.score as double,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 25,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${book.ratings} Ratings on Goodreads',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(10),
                backgroundColor: Colors.teal[200],
                shadowColor: Colors.black,
                elevation: 5,
                textStyle: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () async {
                final path = book.pdfUrl;
                final file = await PDFApi.loadFirebase(path);
                openPDF(context, file!);
              },
              child: const Text(
                'Read This Book',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: book.synopsis,
                  style: const TextStyle(
                    color: kFont,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
