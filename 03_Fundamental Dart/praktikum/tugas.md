## Soal Prioritas 1
1. Membuat rumus keliling dan luas persegi dan persegi panjang dengan dart.
2. Membuat rumus keliling dan luas lingkaran dengan dart.

jawaban:
1. ```dart
   void persegi(int sisi) {
        print('PERSEGI');
        print('Keliling: ${sisi * 4}\nLuas: ${sisi * sisi}');
    }
    ```
     ```dart
    void persegiPanjang(int panjang, int lebar) {
        print('\nPERSEGI PANJANG');
        print('Keliling: ${2 * (panjang + lebar)}\n${panjang * lebar}');
    }
    ```
2. ```dart
    double phi = 3.14;
    void lingkaran(int rad) {
        print('\nLINGKARAN');
        print('Keliling: ${2 * phi * rad}\nLuas: ${phi * rad * rad}');
    }
    ```

## Soal Prioritas 2
1. Membuat function yang menerima 3 variabel String dan menyambungkan 3 variabel tersebut sebagai output.
2. Membuat rumus volume tabung dengan dart.

jawaban:
1. ```dart
    void sambung_kata(String a, String b, String c) {
        print('\n$a $b $c');
    }
    ```
2. ```dart
    double phi = 3.14;
    void vol_silinder(int rad, int tinggi) {
        print('\nSILINDER');
        print('Volume: ${phi * (rad * rad) * tinggi}');
    }
    ```

## Soal Eksplorasi
1. Membuat program untuk mengecek apakah input berupa _Palindrom_. contoh: \
   kasur rusak -> Palindrome\
   mobil balap -> bukan Palindrome
2. Membuat function yang mencari faktor dari input. contoh:\
    input = 24 \
    output -> [1,2,3,4,6,8,12]

jawaban:
1. ```dart
    void is_palindrome(String kata) {
        String a = '';
        for (int i = 0; i < kata.length; i++) {
            a += kata[kata.length - 1 - i];
        }
        if (kata == a) {
            print('\ninput -> $kata');
            print('palindrome');
        } else {
            print('\ninput -> $kata');
            print('bukan palindrome');
        }
    }
    ```
1. ```dart
    void factor(int num) {
        List<int> factors = [];
        for (int i = 1; i < num; i++) {
          if (num % i == 0) {
            factors.add(i);
          }
        }
        print('\ninput -> $num');
        print('$factors');
    }
    ```