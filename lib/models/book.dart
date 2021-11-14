import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String genre;
  String name;
  String writer;
  String date;
  String imgUrl;
  num score;
  num ratings;
  String synopsis;
  String pdfUrl;
  String Id;

  static List<Book> booklist = [];
  static List<Book> savedbooklist = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference books =
      FirebaseFirestore.instance.collection('Books');
  static CollectionReference savedbooks =
      FirebaseFirestore.instance.collection('SavedBooks');

  Book(
    this.genre,
    this.name,
    this.writer,
    this.date,
    this.imgUrl,
    this.score,
    this.ratings,
    this.synopsis,
    this.pdfUrl,
    this.Id,
  );

  static Future getBooks() async {
    books.get().then((querySnapshot) {
      booklist.clear();
      querySnapshot.docs.forEach((element) {
        booklist.add(Book(
            element['Genre'],
            element['Name'],
            element['Writer'],
            element['Date'],
            element['ImageURL'],
            element['Score'],
            element['Ratings'],
            element['Synopsis'],
            element['PdfURL'],
            element['Id']));
      });
    });
  }

  static List<Book> generateBooks() {
    getBooks();
    return booklist;
  }

  static Future getSavedBooks() async {
    savedbooks.get().then((querySnapshot) {
      savedbooklist.clear();
      for (var element in querySnapshot.docs) {
        savedbooklist.add(Book(
            element['Genre'],
            element['Name'],
            element['Writer'],
            element['Date'],
            element['ImageURL'],
            element['Score'],
            element['Ratings'],
            element['Synopsis'],
            element['PdfURL'],
            element['Id']));
      }
    });
  }

  static List<Book> generateSavedBooks() {
    getSavedBooks();
    return savedbooklist;
  }
}
