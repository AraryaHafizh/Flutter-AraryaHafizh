## Prioritas 1
1. Buat sebuah class dengan ketentuan:
    - class hewan
    - property berat: menyimpan data berat hewan
2. Buat sebuah class dengan ketentuan:
    - class mobil
    - property kapasitas: total max berat
    - property muatan: list muatan
    - methoo tambah muatan

Jawaban:
1. ```dart
    class Hewan {
      String nama = '';
      int berat = 0;
      static Map<String, dynamic> dataHewan = {};
      Hewan(nama, berat) {
        this.nama = nama;
        this.berat = berat;
        dataHewan[nama] = berat;
      }
    
      static void showData() {
        dataHewan.forEach((key, value) {
          print('Jenis Hewan: $key');
          print('Berat Hewan: $value');
        });
      }
    }
    ```
1. ```dart
    class Mobil extends Hewan {
      int loadMax = 1000;
      static int addWeight = 0;
      static int loadMax_s = 1000;
      // static int addWeight_s = 0;
      static Map<String, dynamic> payloads = {};

      Mobil(List<Hewan> data) : super(data.first.nama, data.first.  berat) {
        data.forEach((items) {
          payloads[items.nama] = items.berat;
          addWeight += items.berat;
        });
      }

      static void loadCheck() {
        print('Maximum load in car: $loadMax_s');
        print('Load in car: $addWeight');
        print('Remaining Load: ${loadMax_s - addWeight}');
      }

      static void showPayload() {
        payloads.forEach((key, value) {
          print('Nama Muatan: $key');
          print('Berat Muatan: $value');
        });
      }
    }
    ```
## Prioritas 2
1. Buatlah sebuah class Calculator dengan kriteria sebagai berikut:
    - Terdapat method untuk melakukan penjumlahan dua bilangan.
    - Terdapat method untuk melakukan pengurangan dua bilangan.
    - Terdapat method untuk melakukan perkalian dua bilangan.
    - Terdapat method untuk melakukan pembagian dua bilangan.
2. Buatlah sebuah class Course dan Student dengan kriteria sebagai berikut:
    - Atribut dari Course terdiri dari judul dan deskripsi.
    - Atribut dari Student terdiri dari nama, kelas dan daftar course yang dimiliki.
    - Student dapat menambahkan course.
    - Student dapat menghapus course.
    - Student dapat melihat semua course yang telah ditambahkan.

Jawaban:
1. ```dart
    class Calculator {
      int angka1 = 0;
      int angka2 = 0;
      Calculator(int angka1, int angka2) {
        this.angka1 = angka1;
        this.angka2 = angka2;
      }
    
      void penjumalahan() {
        print('${this.angka1}+${this.angka2}: ${this.angka1 + this. angka2}');
      }
    
      void pengurangan() {
        print('${this.angka1}-${this.angka2}: ${this.angka1 - this. angka2}');
      }
    
      void perkalian() {
        print('${this.angka1}*${this.angka2}: ${this.angka1 * this. angka2}');
      }
    
      void pembagian() {
        print('${this.angka1}/${this.angka2}: ${this.angka1 / this. angka2}');
      }
    }
    ```
1. ```dart
    class Course {
      String judul = '';
      String desc = '';
      static Map<String, dynamic> dataCourse = {};
      Course(judul, desc) {
        this.judul = judul;
        this.desc = desc;
        dataCourse[judul] = desc;
      }

      String get getJudul => judul;

      static void showData() {
        print('-----Students Course Options-----\n');
        // print(dataCourse);
        dataCourse.forEach((key, value) {
          print('Nama Course: $key');
          print('Description: $value');
        });
      }
    }

    class Students extends Course {
      String name = '';
      static Map<String, dynamic> studentData = {};
      Students(name, grade, List<Course> course) : super('', '') {
        this.name = name;
        studentData[name] = {
          'name': name,
          'grade': grade,
          'course': course.map((item) => item.judul).toList()
        };
      }

      static void MasterShowData() {
        print('-----The Golden Gate Academy Student data-----\n');
        studentData.forEach((key, value) {
          print('''
    Name      : ${value['name']}
    Grade     : ${value['grade']}
    Course(s) : ${value['course'].join(', ')}
    ''');
        });
      }

      void individualShowData() {
        print('-----Student Data-----\n');
        print('''
    Name     : $name
    Grade    : ${studentData[name]['grade']}
    Course(s): ${studentData[name]['course'].join(', ')}
    ''');
      }

      void delCourse(Course data) {
        studentData[name]['course']!.remove(data.judul);
        print('Berhasil menghapus \'${data.judul}\' dari list   course!');
      }
    }
    ```
## Eksplorasi
1. Sebuah toko buku ingin mengembangkan sebuah sistem untuk mengelola data buku. Data buku tersebut terdiri dari ID, judul, penerbit, harga dan kategori. Sistem tersebut dapat menambahkan, mendapatkan semua data buku dan menghapus data buku. Buatlah program berdasarkan skenario tersebut.

Jawaban:
1. ```dart
    class BookData {
      static Map<String, dynamic> booksData = {};
      BookData(id, judul, penerbit, harga, category) {
        booksData[judul] = [id, judul, penerbit, harga, category];
      }
    
      static void viewData() {
        print('-----The Book Harbor\'s Inventory-----\n');
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
    
      void printBookData(judul) {
        booksData.forEach((key, value) {
          if (key == judul) {
            print('id: ${value[0]}');
            print('title: $key');
            print('publisher: ${value[2]}');
            print('price: \$${value[3]}');
            print('category: ${value[4]}');
          }
        });
      }
    
      void deleteBookData(judul) {
        booksData.remove(judul);
        print('Data buku $judul berhasil di hapus.');
      }
    }
    ```
