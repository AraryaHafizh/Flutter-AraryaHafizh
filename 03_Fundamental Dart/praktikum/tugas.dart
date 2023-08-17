double phi = 3.14;

//-----------------prioritas 1-----------------

void persegi(int sisi) {
  print('PERSEGI');
  print('Keliling: ${sisi * 4}\nLuas: ${sisi * sisi}');
}

void persegiPanjang(int panjang, int lebar) {
  print('\nPERSEGI PANJANG');
  print('Keliling: ${2 * (panjang + lebar)}\n${panjang * lebar}');
}

void lingkaran(int rad) {
  print('\nLINGKARAN');
  print('Keliling: ${2 * phi * rad}\nLuas: ${phi * rad * rad}');
}

// -----------------prioritas 2-----------------

void sambung_kata(String a, String b, String c) {
  print('\n$a $b $c');
}

void vol_silinder(int rad, int tinggi) {
  print('\nSILINDER');
  print('Volume: ${phi * (rad * rad) * tinggi}');
}

// -----------------eksplorasi-----------------

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

void main() {
  persegi(5);
  persegiPanjang(15, 5);
  lingkaran(5);
  String a = 'halo';
  String b = 'selamat';
  String c = 'pagi!';
  sambung_kata(a, b, c);
  vol_silinder(3, 10);
  is_palindrome('kasur rusak');
  is_palindrome('mobil balap');
  factor(24);
}

// hasil dapat dilihat di folder screensots