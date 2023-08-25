//-----------------prioritas 2-----------------
class Calculator {
  int angka1 = 0;
  int angka2 = 0;
  Calculator(int angka1, int angka2) {
    this.angka1 = angka1;
    this.angka2 = angka2;
  }

  void penjumalahan() {
    print('${this.angka1}+${this.angka2}: ${this.angka1 + this.angka2}');
  }

  void pengurangan() {
    print('${this.angka1}-${this.angka2}: ${this.angka1 - this.angka2}');
  }

  void perkalian() {
    print('${this.angka1}*${this.angka2}: ${this.angka1 * this.angka2}');
  }

  void pembagian() {
    print('${this.angka1}/${this.angka2}: ${this.angka1 / this.angka2}');
  }
}

class Course {
  String judul = '';
  String desc = '';
  static Map<String, dynamic> dataCourse = {};
  Course(judul, desc) {
    this.judul = judul;
    this.desc = desc;
    dataCourse[judul] = desc;
  }

  String get getJudul => judul;

  static void showData() {
    print('-----Students Course Options-----\n');
    // print(dataCourse);
    dataCourse.forEach((key, value) {
      print('Nama Course: $key\n');
      print('Description: $value');
    });
  }
}

class Students extends Course {
  String name = '';
  static Map<String, dynamic> studentData = {};
  Students(name, grade, List<Course> course) : super('', '') {
    this.name = name;
    studentData[name] = {
      'name': name,
      'grade': grade,
      'course': course.map((item) => item.judul).toList()
    };
  }

  static void MasterShowData() {
    print('-----Full Student data-----\n');
    studentData.forEach((key, value) {
      print('''
Name      : ${value['name']}
Grade     : ${value['grade']}
Course(s) : ${value['course'].join(', ')}
''');
    });
  }

  void individualShowData() {
    print('-----Selected Student Data-----\n');
    print('''
Name     : $name
Grade    : ${studentData[name]['grade']}
Course(s): ${studentData[name]['course'].join(', ')}
''');
  }

  void delCourse(Course data) {
    var judul = data.judul;
    var target = studentData[name]['course'];
    if (target.contains(judul)) {
      target.remove(judul);
      print('Berhasil menghapus \'$judul\' dari list course!');
    }
    else {
      print('Anda tidak mengambil course \'$judul\', silahkan cek kembali.');
    }
  }
}

void main() {
  var calc1 = Calculator(5, 2);
  calc1.penjumalahan();
  calc1.pengurangan();
  calc1.pembagian();
  calc1.perkalian();
  print('');

  var course1 = Course('Intro to Programming',
      'In this course, you will learn the basics of programming.');
  var course2 = Course('Web Development Fundamentals',
      'Learn the essentials of web development and create interactive websites.');
  var course3 = Course('Data Science Essentials',
      'Explore data analysis and visualization techniques using real-world datasets.');
  // var course4 = Course('Digital Marketing Strategies',
  //     'Discover effective digital marketing strategies to promote products and services.');
  // var course5 = Course('Creative Writing Workshop',
  //     'Unleash your creativity through various writing exercises and workshops.');
  // var course6 = Course('Photography Basics',
  //     'Master the art of photography, from understanding camera settings to composition.');
  // var course7 = Course('Financial Literacy 101',
  //     'Gain a solid foundation in personal finance and money management.');
  // var course8 = Course('Introduction to Psychology',
  //     'Explore the fascinating world of human behavior and psychological theories.');
  // var course9 = Course('Beginner\'s Yoga Class',
  //     'Start your yoga journey with basic poses and relaxation techniques.');
  // var course10 = Course('Entrepreneurship and Innovation',
  //     'Learn how to turn your innovative ideas into successful business ventures.');

  Course.showData();
  var student1 = Students('Adi', 5, [course1, course3]);
  var student2 = Students('Bella', 11, [course1, course2, course3]);
  var student3 = Students('Chris', 8, [course2, course3]);
  // var student1 = Students('Adi', 5, [course3, course5]);
  // var student2 = Students('Bella', 11, [course1, course4, course7, course1]);
  // var student3 = Students('Chris', 8, [course2, course6, course9]);
  // var student4 =
  //     Students('Diana', 12, [course5, course8, course10, course2, course6]);
  // var student5 = Students('Ethan', 3, [course1, course3, course10]);
  // var student6 = Students('Fiona', 5, [course9]);
  // var student7 = Students('George', 2, [course2, course5]);
  // var student8 = Students('Hannah', 10, [course3, course10]);
  // var student9 = Students('Ian', 7, [course1]);
  // var student10 = Students('Jessica', 4, [course2, course5, course8]);

  print('');
  Students.MasterShowData();
  student1.individualShowData();
  student1.delCourse(course1);
  print('');
  student1.individualShowData();
}
