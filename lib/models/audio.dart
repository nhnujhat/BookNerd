import 'package:cloud_firestore/cloud_firestore.dart';

class Audio {
  String name;
  String imgUrl;
  String audioUrl;
  String Id;

  static List<Audio> audiolist = [];
  static List<Audio> savedaudiolist = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference audios =
      FirebaseFirestore.instance.collection('Audios');
  static CollectionReference savedaudios =
      FirebaseFirestore.instance.collection('SavedAudios');

  Audio(
    this.name,
    this.imgUrl,
    this.audioUrl,
    this.Id,
  );

  static Future getAudios() async {
    audios.get().then((querySnapshot) {
      audiolist.clear();
      querySnapshot.docs.forEach((element) {
        audiolist.add(Audio(element['Name'], element['ImageURL'],
            element['AudioURL'], element['Id']));
      });
    });
  }

  static List<Audio> generateAudios() {
    getAudios();
    return audiolist;
  }

  static Future getSavedAudios() async {
    savedaudios.get().then((querySnapshot) {
      savedaudiolist.clear();
      querySnapshot.docs.forEach((element) {
        savedaudiolist.add(Audio(element['Name'], element['ImageURL'],
            element['AudioURL'], element['Id']));
      });
    });
  }

  static List<Audio> generateSavedAudios() {
    getSavedAudios();
    return savedaudiolist;
  }
}
