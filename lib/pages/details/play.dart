import 'package:book_nerd/constants/colors.dart';
import 'package:book_nerd/models/audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayPage extends StatefulWidget {
  final Audio audio;
  const PlayPage(this.audio, {Key? key}) : super(key: key);
  static List<Audio> savedlist = [];

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  child: Container(
                    child: Image(
                      image: FirebaseImage(widget.audio.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(25),
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        widget.audio.name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: IconButton(
                      onPressed: () async {
                        play(widget.audio.audioUrl);
                      },
                      icon: const Icon(
                        Icons.play_circle_outline_outlined,
                      ),
                      iconSize: 70,
                    )),
                    Container(
                        child: IconButton(
                      onPressed: () async {
                        pause();
                      },
                      icon: const Icon(
                        Icons.pause_circle_outline,
                      ),
                      iconSize: 70,
                    )),
                    Container(
                        child: IconButton(
                      onPressed: () async {
                        stop();
                      },
                      icon: const Icon(
                        Icons.stop_circle_outlined,
                      ),
                      iconSize: 70,
                    )),
                  ],
                ),
              ],
            ),
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
                .collection('SavedAudios')
                .doc(widget.audio.Id)
                .set({
              'Name': widget.audio.name,
              'ImageURL': widget.audio.imgUrl,
              'AudioURL': widget.audio.audioUrl,
              'Id': widget.audio.Id,
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

  play(url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
  }

  stop() async {
    int result = await audioPlayer.stop();
  }
}
