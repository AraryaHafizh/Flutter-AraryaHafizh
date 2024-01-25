// import 'package:ararya_hafizh/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic tes;
  dynamic tesE;

  Future<void> fetchData() async {
    final dio = Dio();

    // Data yang akan dikirim ke API
    Map<String, dynamic> requestData = {
      "email": "badu@gmail.com",
      "password": "badu1234a"
    };

    try {
      final response = await dio.get(
          // 'http://13.229.89.154:8080/user',
          // 'https://65308dd96c756603295ec185.mockapi.io/myits_mobile/data_app',
          // 'https://newapp-hfzh-default-rtdb.asia-southeast1.firebasedatabase.app/data/menuBestSeller.json',
          // 'https://newapp-hfzh-default-rtdb.asia-southeast1.firebasedatabase.app/data/menu.json',
          // 'https://newapp-hfzh-default-rtdb.asia-southeast1.firebasedatabase.app/data/menuByCategory.json',
          // 'https://altaresto.my.id/user/menu/category/1',
          'https://altaresto.my.id/user/menu/name/nasi padang',
          // data: requestData,
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDE3ODE3ODIsImlhdCI6MTcwMTY5NTM4MiwiaWQiOjEsInJvbGUiOiJ1c2VyIn0.n1-fdtjYdMC35dvhUtkI1aNRoceRsgluSAJi-_1px9g'
          }));

      if (response.statusCode == 200) {
        setState(() {
          tes = response.data;
          // Proses data yang diterima dari API
        });
      } else {
        print(
            'Gagal mengambil data dari API. Status code: ${response.statusCode}');
      }
    } catch (error) {
      if (error is DioException) {
        // Cek apakah responsenya ada dan status kode 500
        if (error.response != null && error.response!.statusCode == 500) {
          tesE = error.response!.data;
          print('Error 500: ${error.response!.data}');
        } else {
          setState(() {
            tesE = error.message;
          });
          print('Error: ${error.message}');
        }
      } else {
        print('Error: $error');
      }
    }
  }

  // Future<void> fetchData() async {
  //   final dio = Dio();

  //   final appResponse =
  //       await dio.post('http://13.229.89.154:8080/user/login');
  //   if (appResponse.statusCode == 200) {
  //     setState(() {
  //       tes = appResponse.data; // Menggunakan data Pokemon langsung
  //       // print(appData);
  //     });
  //   } else {
  //     print('Gagal mengambil data dari API');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // dynamic getStudData(request, nrp) {
  //   dynamic reqData;
  //   tes.forEach((key, value) {
  //     if (key == nrp.toString()) {
  //       reqData = value[request];
  //     }
  //   });
  //   return reqData;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Page'),
      ),
      body: ListView.builder(
        // itemCount: tes['bestSeller'].length,
        // itemCount: tes.length,
        // itemCount: tes['Appetizer'].length,
        itemCount: 1,
        itemBuilder: (context, index) {
          // var isTrue = tes['response']['success'];
          // return Text(tes['bestSeller'][index].toString());
          // return Text(tes[index]['name'].toString());
          // return Text(tes['Appetizer'].toString());
          print(tes);
          return Text(tes['results']['image'].toString());
        },
      ),
    );
  }
}
