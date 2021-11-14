import 'package:book_nerd/constants/colors.dart';
import 'package:book_nerd/models/book.dart';
import 'package:book_nerd/pages/details/widgets/book_cover.dart';
import 'package:book_nerd/pages/details/widgets/book_detail.dart';
import 'package:book_nerd/pages/details/widgets/book_review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  DetailPage(this.book, {Key? key}) : super(key: key);
  static List<Book> savedlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookCover(book),
            BookDetail(book),
            BookReview(book),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: kFont,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('SavedBooks')
                .doc(book.Id)
                .set({
              'Genre': book.genre,
              'Name': book.name,
              'Writer': book.writer,
              'Date': book.date,
              'ImageURL': book.imgUrl,
              'Score': book.score,
              'Ratings': book.ratings,
              'Synopsis': book.synopsis,
              'PdfURL': book.pdfUrl,
              'Id': book.Id,
            });
          },
          icon: const Icon(
            Icons.bookmark_border_outlined,
            color: kFont,
          ),
        ),
      ],
    );
  }
}
