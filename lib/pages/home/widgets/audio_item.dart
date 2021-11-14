import 'package:book_nerd/models/audio.dart';
import 'package:book_nerd/pages/details/play.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

class AudioItem extends StatelessWidget {
  final Audio audio;
  const AudioItem(this.audio, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PlayPage(audio))
      ),
      child: Container(
        height: 220.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FirebaseImage(audio.imgUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
