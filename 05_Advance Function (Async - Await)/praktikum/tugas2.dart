Future<void> faktorial(num) async {
  int hasil = 1;
  for (int i = 1; i <= num; i++) {
    hasil *= i;
  }
  // return number;
  await Future.delayed(Duration(seconds: 2));
  print('hasil: $hasil');
}

Future<void> main() async {
  int angka = 5;
  var soal4 = faktorial(angka);
  print('Memulai menghitung faktorial $angka...');
  await soal4;
  print('proses selesai');
}
