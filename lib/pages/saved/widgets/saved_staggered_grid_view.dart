import 'package:book_nerd/models/audio.dart';
import 'package:book_nerd/models/book.dart';
import 'package:book_nerd/pages/home/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../home/widgets/audio_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SavedStaggeredGridView extends StatelessWidget {
  final int savedselected;
  final PageController savedpageController;
  final Function savedcallback;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference savedbooks = FirebaseFirestore.instance.collection('SavedBooks');
  CollectionReference savedaudios = FirebaseFirestore.instance.collection('SavedAudios');

  SavedStaggeredGridView(this.savedselected, this.savedpageController, this.savedcallback,
      {Key? key})
      : super(key: key);
  final savedbookList = Book.generateSavedBooks();
  final savedaudiolist = Audio.generateSavedAudios();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PageView(
        controller: savedpageController,
        onPageChanged: (index) => savedcallback(index),
        children: [
          StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 4,
              itemCount: savedbookList.length,
              itemBuilder: (_, index) => BookItem(savedbookList[index]),
              staggeredTileBuilder: (_) => const StaggeredTile.fit(2)),
          StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 4,
              itemCount: savedaudiolist.length,
              itemBuilder: (_, index) => AudioItem(savedaudiolist[index]),
              staggeredTileBuilder: (_) => const StaggeredTile.fit(2)),
        ],
      ),
    );
  }
}
