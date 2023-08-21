//-----------------prioritas 1-----------------
String nilai(double num) {
  if (num >= 70) {
    return ('${num} -> Nilai A');
  } else if (num >= 40) {
    return ('${num} -> Nilai B');
  } else if (num >= 0) {
    return ('${num} -> Nilai c');
  } else {
    return ('');
  }
}

void loop() {
  List<int> num = [];
  for (int i = 1; i < 11; i++) {
    num.add(i);
  }
  print(num);
}

//-----------------prioritas 2-----------------

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

  for (int i = tinggi - 1; i >= 1; i--) {
    var hasil = '';
    for (int j = 1; j < i; j++) {
      hasil += " ";
    }

    for (int k = 1; k <= 2 * (tinggi - i) + 1; k++) {
      hasil += "*";
    }

    print(hasil);
  }
}

void faktorial(int num) {
  int hasil = 1;
  for (int i = 1; i <= num; i++) {
    hasil *= i;
  }
  // return number;
  print('faktor dari $num: $hasil');
}

void lingkaran(int rad) {
  double phi = 3.14;
  print('Luas lingkaran: ${phi * rad * rad}');
}

//-----------------Eksplorasi-----------------

String prima(int num) {
  List<int> mod = [];

  for (int i = 1; i <= num; i++) {
    if (num % i == 0) {
      mod.add(i);
    }
  }
  if (num == 2) {
    return '${num} merupakan bilangan prima';
  }
  if (mod.length > 2 || num < 6) {
    return '${num} bukan merupakan bilangan prima';
  }
  return '${num} merupakan bilangan prima';
}

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

void main() {
  var hasil = nilai(99);
  print(hasil);
  loop();
  pyramid(3);
  jamPasir(3);
  faktorial(10);
  lingkaran(5);
  var prime = prima(23);
  var prime2 = prima(27);
  print(prime);
  print(prime2);
  tabelPerkalian(5);
}
