//-----------------prioritas 1-----------------
class Hewan {
  String nama = '';
  int berat = 0;
  static Map<String, dynamic> dataHewan = {};
  Hewan(nama, berat) {
    this.nama = nama;
    this.berat = berat;
    dataHewan[nama] = berat;
  }

  static void showData() {
    dataHewan.forEach((key, value) {
      print('Jenis Hewan: $key');
      print('Berat Hewan: $value');
    });
  }
}

class Mobil extends Hewan {
  int loadMax = 1000;
  static int addWeight = 0;
  static int loadMax_s = 1000;
  // static int addWeight_s = 0;
  static Map<String, dynamic> payloads = {};

  Mobil(List<Hewan> data) : super(data.first.nama, data.first.berat) {
    data.forEach((items) {
      payloads[items.nama] = items.berat;
      addWeight += items.berat;
    });
  }

  static void loadCheck() {
    print('Maximum load: $loadMax_s');
    print('Current Load: $addWeight');
    print('Remaining Load: ${loadMax_s - addWeight}');
  }

  static void showPayload() {
    payloads.forEach((key, value) {
      print('Nama Muatan: $key');
      print('Berat Muatan: $value');
    });
  }
}

void main() {
  var kucing = Hewan("Kucing", 5);
  var anjing = Hewan("Anjing", 10);
  var burung = Hewan("Burung", 1);
  var kuda = Hewan("Kuda", 700);
  var ikan = Hewan("Ikan", 1);
  var kanguru = Hewan("Kanguru", 70);
  var sapi = Hewan("Sapi", 500);
  var kuraKura = Hewan("Kura-kura", 10);
  var ular = Hewan("Ular", 15);

  var muatan1 = Mobil([kucing, anjing]);
  var muatan2 = Mobil([burung, kuda]);

  Hewan.showData();
  print('');
  Mobil.showPayload();
  print('');
  Mobil.loadCheck();

}
