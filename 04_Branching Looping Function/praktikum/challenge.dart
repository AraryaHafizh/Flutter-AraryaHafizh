// buat sebuah function yang menghitung jumlah dari pembelian buku,  pensi, dan tas

double belanja(List<double> items) {
  double total = 0;
  for (int i = 0; i < items.length; i++) {
    total += items[i];
  }
  return total;
}

// buatlah function yang menghitung diskon dari variabel total pembelian

double disc(total, discount) {
  return total - (total * discount);
}

// buatlah function yang menghitung Total pembelian setelah diskon

double totalDisc(price, discount) {
  return price - (price * discount);
}

void main() {
  double buku = 10000;
  double pensil = 5000;
  double tas = 100000;
  double total_pembelian = 200000;
  double diskon = 0.1;

  var one = belanja([buku, pensil, tas]);
  var two = disc(total_pembelian, diskon);
  var three = totalDisc(one, diskon);
  print('Soal 1: Rp $one');
  print('Soal 2: Rp $two');
  print('Soal 3: Rp $three');
}
