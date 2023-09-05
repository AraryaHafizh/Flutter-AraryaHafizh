import 'dart:math';

//----------------prioritas 1----------------
class BangunRuang {
  int panjang;
  int lebar;
  int tinggi;
  BangunRuang(this.panjang, this.lebar, this.tinggi);
  void volume() {
    var hitung = this.panjang * this.lebar * this.tinggi;
    print(
        'Volume bangun ruang dengan panjang $panjang, lebar $lebar, dan tingi $tinggi: $hitung');
  }
}

class Kubus extends BangunRuang {
  int sisi;
  Kubus(this.sisi) : super(sisi, sisi, sisi);
  @override
  void volume() {
    var hitung = pow(sisi, 3);
    print('Volume dari kubus dengan sisi $sisi: $hitung');
  }
}

class Balok extends BangunRuang {
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);
}

//----------------prioritas 2----------------
class Math {
  void hasil() {}
}

class Kpk implements Math {
  int a = 1;
  int b = 1;
  Kpk(this.a, this.b);
  void hasil() {
    var hasil = [];
    for (int i = 1; i <= 100; i++) {
      for (int j = 1; j <= 100; j++) {
        if (a * i == b * j) {
          hasil.add(a * i);
        }
      }
    }
    print('KPK dari $a, dan $b adalah: ${hasil[0]}');
  }
}

class Fpb implements Math {
  int a = 0;
  int b = 0;
  Fpb(this.a, this.b);

  List<int> findFactor(value) {
    List<int> nilai = [];
    for (int i = 1; i <= value; i++) {
      if (value % i == 0) {
        nilai.add(i);
      }
    }
    return nilai;
  }

  void hasil() {
    var faktorA = findFactor(this.a);
    var faktorB = findFactor(this.b);
    var hasil = [];
    for (var value in faktorA) {
      if (faktorB.contains(value)) {
        hasil.add(value);
      }
    }
    print('FPB dari $a dan $b adalah: ${hasil.last}');
  }
}

//----------------eksplorasi----------------
class Shape {
  int getArea() {
    return 0;
  }

  int getPerimeter() {
    return 0;
  }
}

class Circle implements Shape {
  int rad = 0;
  double pi = 3.14159;
  Circle(this.rad);

  int getArea() {
    double hasil = pi * (pow(rad, 2));
    return hasil.toInt();
  }

  int getPerimeter() {
    double hasil = 2 * pi * rad;
    return hasil.toInt();
  }
}

class Square implements Shape {
  int side = 0;
  Square(this.side);

  int getArea() {
    int hasil = pow(side, 2).toInt();
    return hasil;
  }

  int getPerimeter() {
    int hasil = 4 * side;
    return hasil;
  }
}

class Rectangle implements Shape {
  int width = 0;
  int height = 0;
  Rectangle(this.width, this.height);

  int getArea() {
    int hasil = width * height;
    return hasil;
  }

  int getPerimeter() {
    int hasil = 2 * (width * height);
    return hasil;
  }
}

void main() {
  var kubus1 = Kubus(5);
  var balok1 = BangunRuang(5, 4, 2);
  kubus1.volume();
  balok1.volume();
  print('');
  
  var kpk1 = Kpk(5, 2);
  var fpb1 = Fpb(12, 18);
  kpk1.hasil();
  fpb1.hasil();
  print('');

  var one = Circle(5);
  var two = Square(10);
  var three = Rectangle(15, 5);
  print('''
Luas dari lingkaran dengan jari-jari ${one.rad}: ${one.getArea()}
Keliling dari lingkaran dengan jari-jari ${one.rad}: ${one.getPerimeter()}
Luas dari persegi dengan sisi ${two.side}: ${two.getArea()}
Keliling dari persegi dengan sisi ${two.side}: ${two.getPerimeter()}   
Luas dari persegi panjang dengan panjang ${three.height} dan lebar ${three.width}: ${three.getArea()}
Keliling dari persegi panjang dengan panjang ${three.height} dan lebar ${three.width}: ${three.getPerimeter()}''');
}
