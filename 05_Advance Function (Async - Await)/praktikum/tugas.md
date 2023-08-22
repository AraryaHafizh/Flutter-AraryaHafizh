## Soal Prioritas 1
1. Buatlah sebuah fungsi dengan spesifikasi berikut:
    - Menerima 2 parameter, yaitu list data dan pengali
    - Lakukan perulangan pada list data secara asynchronous
    - Tiap perulangan, kalikan elemen list data dengan pengali
    - Return list baru yang berisi hasil proses diatas
    
jawaban:
1.  ```dart
    List<dynamic> pengkali(list, int pengkali) {
      List<int> output = [];
      for (int i = 0; i < list.length; i++) {
        output.add(list[i] * pengkali);
      }
      return [list, output];
    }
    ```
## Soal Prioritas 2
1. Buatlah sebuah list dengan spesifikasi berikut:
    - Tiap elemen wajib berupa list juga
    - tiap element wajib terdapat 2 data(sub-elemen)
    - Buatlah sebuah map dengan menggunakan list tersebut
2. Buatlah sebuah program untuk menghitung rata-rata dari sekumpulan nilai. Lakukan pembulatan keatas untuk nilai hasil perhitungan rata-rata.
    
    **Sampel Input:** `[7,5,3,5,2,1]`    
    **Sampel Output:** `4`
3. Buatlah sebuah program untuk melakukan perhitungan bilangan faktorial secara asinkron.
    
    **Sampel Input:** `5`    
    **Sampel Output:** `120`

jawaban:
1.  ```dart
    List<dynamic> listmap() {
      List<List<dynamic>> listinList = [
        ['one', 1],
        ['two', 2],
        ['three', 3]
      ];
      Map<String, dynamic> listtoMap = {};
      for (var sublist in listinList) {
        listtoMap[sublist[0]] = [sublist[1]];
      }
      return [listinList, listtoMap];
    }
    ```
1.  ```dart
    List<dynamic> pembulatan(input) {
      double output = 0;
      for (int items in input) {
        output += items;
      }
      output = output / input.length;
      return [input, output.ceil()];
    }
    ```
1.  ```dart
    Future<void> faktorial(num) async {
      int hasil = 1;
      for (int i = 1; i <= num; i++) {
        hasil *= i;
      }
      // return number;
      await Future.delayed(Duration(seconds: 1));
      print('hasil: $hasil');
    }
    ```
## Soal Eksplorasi
1. Buatlah sebuah program untuk menghilangkan nilai atau data yang sama pada sebuah data sehingga output akhirnya adalah sekumpulan nilai atau data yang unik.
    
    **Sampel Input:** `[amuse, tommy kaira, spoon, HKS, litchfield, amuse, HKS]`    
    **Sampel Output:** `[amuse, tommy kaira, spoon, HKS, litchfield]`    

    **Sampel Input:** `[JS Racing, amuse, spoon, spoon, JS Racing, amuse]`\
    **Sampel Output:** `[JS Racing, amuse, spoon]`
1. Buatlah sebuah program untuk menghitung frekuensi pada setiap data di dalam sebuah list. Frekuensi merupakan jumlah kemunculan data di dalam list.
    
    **Sampel Input:** `[js,js,js,golang,python,js,js,golang,rust]`    
    **Sampel Output:** `js: 5, golang: 2, python: 1, rust: 1`

jawaban:
1.  ```dart
    List<dynamic> noDouble(input) {
      List<dynamic> output = [];
      for (var data in input) {
        if (!output.contains(data)) {
          output.add(data);
        }
      }
      return [input, output];
    }
    ```
1.  ```dart
    List<dynamic> freq(input) {
      Map<String, dynamic> output = {};
      for (var items in input) {
        if (output.containsKey(items)) {
          output[items]++;
        } else {
          output[items] = 1;
        }
        ;
      }
      return [input, output];
    }
    ```