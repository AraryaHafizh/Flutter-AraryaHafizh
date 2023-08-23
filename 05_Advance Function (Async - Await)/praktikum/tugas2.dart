//-----------------prioritas 1-----------------
Future<List<dynamic>> pengkali(list, int pengkali) async {
  List<int> output = [];
  for (int i = 0; i < list.length; i++) {
    await Future.delayed(Duration(seconds: 2));
    output.add(list[i] * pengkali);
  }
  return [list, output];
}

//-----------------prioritas 2-----------------
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
  print('Memulai menghitung list...');
  var soal1 = await pengkali([2, 4, 6, 8], 2);
  print('List awal: ${soal1[0]} \nList akhir: ${soal1[1]}');
  print('--------------');
  int angka = 5;
  var soal4 = faktorial(angka);
  print('Memulai menghitung faktorial $angka...');
  await soal4;
  print('proses selesai');
}
