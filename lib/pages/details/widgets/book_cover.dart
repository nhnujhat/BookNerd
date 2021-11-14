import 'package:book_nerd/models/book.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final Book book;
  const BookCover(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Container(
        child: Image(
          image: FirebaseImage(book.imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
