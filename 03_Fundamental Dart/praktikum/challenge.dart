void persegi_panjang(int panjang, int lebar) {
  int hasil = 2 * (panjang + lebar);
  print('Keliling Persegi Panjang: $hasil');
}

void segi3(int a, int b, int c) {
  int hasil = a + b + c;
  print('Keliling segitiga: $hasil');
}

void main() {
  persegi_panjang(10, 5);
  segi3(3, 4, 5);
}
