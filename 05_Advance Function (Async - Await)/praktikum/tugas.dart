import 'dart:math';

//-----------------prioritas 1-----------------
List<dynamic> pengkali(list, int pengkali) {
  List<int> output = [];
  for (int i = 0; i < list.length; i++) {
    output.add(list[i] * pengkali);
  }
  return [list, output];
}

//-----------------prioritas 2-----------------
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

List<dynamic> pembulatan(input) {
  double output = 0;
  for (int items in input) {
    output += items;
  }
  output = output / input.length;
  return [input, output.ceil()];
}

//-----------------eksplorasi-----------------
List<dynamic> noDouble(input) {
  List<dynamic> output = [];
  for (var data in input) {
    if (!output.contains(data)) {
      output.add(data);
    }
  }
  return [input, output];
}

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

void main() {
  var soal1 = pengkali([2, 4, 6, 8], 2);
  print('list awal : ${soal1[0]}\nlist hasil: ${soal1[1]}');
  print('--------------');
  var soal2 = listmap();
  print('List didalam list: ${soal2[0]}\nList to map      : ${soal2[1]}\n');
  var soal3 = pembulatan([7, 5, 3, 5, 2, 1]);
  print('Input    : ${soal3[0]}\nrata-rata: ${soal3[1]}');

  print('--------------');
  var soal5 = noDouble(
      ['amuse', 'tommy kaira', 'spoon', 'HKS', 'litchfield', 'amuse', 'HKS']);
  var soal5_1 =
      noDouble(['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse']);
  print('input  : ${soal5[0]}\noutput : ${soal5[1]}');
  print('input  : ${soal5_1[0]}\noutput : ${soal5_1[1]}\n');
  var soal6 = freq(
      ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust']);
  print('input  : ${soal6[0]}\noutput : ${soal6[1]}');
}
