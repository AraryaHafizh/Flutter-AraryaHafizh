## Soal Prioritas 1

1. Terdapat sebuah nilai:
   - jika nilai > 70 akan mereturn “Nilai A”
   - jika nilai > 40 akan mereturn “Nilai B”
   - jika nilai > 0 akan mereturn “Nilai C”
   - selain itu return teks kosong
2. tampilkan nilai 1-10 dengan loop!

jawaban:

1. ```dart
   String nilai(double num) {
     if (num >= 70) {
       return ('Nilai A');
     } else if (num >= 40) {
       return ('Nilai B');
     } else if (num >= 0) {
       return ('Nilai c');
     } else {
       return ('');
     }
   }
   ```
1. ```dart
   void loop() {
     List<int> num = [];
     for (int i = 1; i < 11; i++) {
       num.add(i);
     }
     print(num);
   }
   ```

## Soal Prioritas 2

1. Buatlah sebuah piramid bintang
1. Buatlah sebuah jam pasir
1. tampilkan faktorial dari nilai nilai dibawah in:
   - 10
   - 40
   - 50
1. Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran. kemudian function lingkaran tersebut dijalankan pada function main!

jawaban:

1. ```dart
   void pyramid(int tinggi) {
     for (int i = 0; i < tinggi; i++) {
       var hasil = '';
       for (int j = (tinggi - i); j > 1; j--) {
         hasil += ' ';
       }
       for (int j = 0; j <= i; j++) {
         hasil += '* ';
       }
       print(hasil);
     }
   }
   ```
1. ```dart
   void jamPasir(int tinggi) {
     for (int i = 1; i <= tinggi; i++) {
       var hasil = '';
       for (int j = 1; j < i; j++) {
         hasil += " ";
       }

       for (int k = 1; k <= 2 * (tinggi - i) + 1; k++) {
         hasil += "*";
       }

       print(hasil);
     }
   ```
1. ```dart
   int faktorial(int num) {
      int hasil = 1;
      for (int i = 1; i <= num; i++) {
        hasil *= i;
      }
      // return number;
      return hasil;
    }
   ```
1. ```dart
   int faktorial(int num) {
      int hasil = 1;
      for (int i = 1; i <= num; i++) {
        hasil *= i;
      }
      // return number;
      return hasil;
    }
   ```
## Soal Eksplorasi
1. Buatlah sebuah program untuk mengecek apakah sebuah bilangan termasuk bilangan prima atau bukan.
    
    **Sampel Input:** `23`
    
    **Sampel Output:** `bilangan prima`
    
    **Sampel Input:** `12`
    
    **Sampel Output:** `bukan bilangan prima`
2. Buatlah sebuah program untuk mencetak tabel perkalian.

jawaban:
1. ```dart
    String prima(int num) {
      List<int> mod = [];
    
      for (int i = 1; i <= num; i++) {
        if (num % i == 0) {
          mod.add(i);
        }
      }
      if (num == 2) {
        return 'Bilangan Prima';
      }
      if (mod.length > 2 || num < 6) {
        return 'Bukan Bilangan Prima';
      }
      return 'Bilangan Prima';
    }
    ```
1. ```dart
    void tabelPerkalian(int n) {
      for (int i = 1; i <= n; i++) {
        var hasil = '';
        for (int j = 1; j <= n; j++) {
          // hasil += '${i * j}\t';
          hasil += '${i * j}\t';
        }
        print(hasil);
        // print(hasil);
      }
    }
    ```