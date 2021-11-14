import 'package:book_nerd/models/book.dart';
import 'package:book_nerd/pages/details/detail.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(book))
      ),
      child: Container(
        height: 220.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FirebaseImage(book.imgUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
