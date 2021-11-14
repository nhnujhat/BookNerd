import 'package:book_nerd/models/book.dart';
import 'package:book_nerd/pages/details/detail.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

class SavedItem extends StatelessWidget {
  final Book book;
  const SavedItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailPage(book))),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 12),
                    Text(book.writer, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    const SizedBox(height: 8),
                    Text(book.genre, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
