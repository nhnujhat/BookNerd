import 'package:book_nerd/models/audio.dart';
import 'package:book_nerd/models/book.dart';
import 'package:book_nerd/pages/home/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'audio_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookStaggeredGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference books = FirebaseFirestore.instance.collection('Books');
  CollectionReference audios = FirebaseFirestore.instance.collection('Audios');

  BookStaggeredGridView(this.selected, this.pageController, this.callback,
      {Key? key})
      : super(key: key);
  final bookList = Book.generateBooks();
  final audiolist = Audio.generateAudios();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: [
          StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 4,
              itemCount: bookList.length,
              itemBuilder: (_, index) => BookItem(bookList[index]),
              staggeredTileBuilder: (_) => const StaggeredTile.fit(2)),
          StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 4,
              itemCount: audiolist.length,
              itemBuilder: (_, index) => AudioItem(audiolist[index]),
              staggeredTileBuilder: (_) => const StaggeredTile.fit(2)),
        ],
      ),
    );
  }
}
