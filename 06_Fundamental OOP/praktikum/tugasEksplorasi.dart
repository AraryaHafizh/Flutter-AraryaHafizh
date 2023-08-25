//-----------------eksplorasi_-----------------
class BookData {
  String judul = '';
  static Map<String, dynamic> booksData = {};
  BookData(id, judul, penerbit, harga, category) {
    this.judul = judul;
    booksData[judul] = [id, judul, penerbit, harga, category];
  }

  static void viewData() {
    print('-----The Library Inventory-----\n');
    booksData.forEach((key, value) {
      print('''
ID        : ${value[0]}
Judul     : ${value[1]} 
Penerbit  : ${value[2]} 
harga     : \$${value[3]} 
category  : ${value[4]} 
''');
    });
  }

  void printBookData() {
    var items = booksData[judul];
    print('$judul Data');
    print('''
ID        : ${items[0]}
Judul     : ${items[1]} 
Penerbit  : ${items[2]} 
harga     : \$${items[3]} 
category  : ${items[4]} 
''');
  }

  static void deleteBookData(book) {
    var judul = book.judul;
    if (booksData.containsKey(judul)) {
      booksData.remove(book.judul);
      print('Berhasil menghapus \'$judul\' dari database.');
    }
  }
}

void main() {
  var book1 =
      BookData(1, 'Health and Wellness', 'Vitality Publishing', 28, 'Health');
  var book2 =
      BookData(2, 'Programming 101', 'Tech Publications', 40, 'Programming');
  var book3 =
      BookData(3, 'Travel Adventures', 'Wanderlust Books', 30, 'Travel');
  var book4 = BookData(4, 'Mystery Unveiled', 'Enigma Press', 20, 'Mystery');
  var book5 = BookData(
      5, 'Historical Chronicles', 'Past & Present Books', 35, 'History');
  // var book6 =
  //     BookData(6, 'Science Explained', 'Curiosity Publishers', 45, 'Science');
  // var book7 =
  //     BookData(7, 'Artistry in Design', 'Creative Minds Media', 28, 'Art');
  // var book8 =
  //     BookData(8, 'Romantic Escapes', 'Heartfelt Publications', 22, 'Romance');
  // var book9 =
  //     BookData(9, 'Business Strategies', 'Enterprise Press', 50, 'Business');
  // var book10 =
  //     BookData(10, 'Fantasy Realms', 'Imagination Books', 18, 'Fantasy');

  BookData.viewData();
  book1.printBookData();
  BookData.deleteBookData(book1);
  print('');
  BookData.viewData();
}
