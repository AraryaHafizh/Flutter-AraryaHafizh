import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiKey = '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';

  TextEditingController price = TextEditingController();
  TextEditingController tier = TextEditingController();
  TextEditingController storage = TextEditingController();

  Dio dio = Dio();
  String gptOutput = '';
  String outputtes = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            const Text("Flutter with OpenAI", style: TextStyle(fontSize: 18)),
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 35),
          child: Column(
            children: [
              const Text(
                'Masukkan kriteria yang di inginkan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 35),
              txtField(price, 'Budget dalam IDR', 'Rp 1.000.000',
                  TextInputType.number),
              txtField(tier, 'Tier yang diharapkan', 'Low, mid, high end',
                  TextInputType.text),
              txtField(storage, 'Storage yang diharapkan', '128 gb',
                  TextInputType.number),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    submit();
                    price.clear();
                    tier.clear();
                    storage.clear();
                    setState(() {
                      gptOutput = "";
                    });
                    // tes();
                  },
                  child: const Text('Submit'),
                ),
              ),
              const Text('Output:'),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.black26),
                    borderRadius: BorderRadius.circular(12)),
                height: MediaQuery.of(context).size.height - 520,
                width: MediaQuery.of(context).size.width,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: Text(gptOutput, textAlign: TextAlign.start),
                          // child: Text(outputtes, textAlign: TextAlign.start),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> tes() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   await Future.delayed(Duration(seconds: 2));
  //   outputtes = 'hello world';
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  Future<void> submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await dio.post('https://api.openai.com/v1/chat/completions',
              data: {
                'model': 'gpt-3.5-turbo',
                'messages': [
                  {
                    'role': 'system',
                    'content': 'You are a smartphone seller specialist.'
                  },
                  {
                    'role': 'user',
                    'content':
                        'Berikan saya rekomendasi smartphone dengan kriteria berikut, maksimal harga dalam IDR ${price.text}, tier smartphone yang diharapkan buyer ${tier.text}, dan storage yang diharapkan buyer ${storage.text}. Jika tier smartphone diatas tier yang diharapkan dan masih masuk di kriteria harga dan storage maka masukkan juga dalam list sebagai \'recommendation\' section. Output yang diharapkan adalah: brand dan nama hp, harga, tier, besar storage, pros and cons dalam deskripsi singkat. Jika salah satu kriteria tidak terpenuhi maka beritau user bahwa dalam range harga yang dimasukkan user, dengan tier yang dimasukkan user, dan storage yang dimasukkan user tidak ditemukan. Untuk output recommendation section tampilkan brand dan nama hp, harga, tier, besar storage jika ada opsi storage lainnya tampilkan juga, deskripsi singkat pros and cons dan mengapa anda menambahkan device tersebut ke recommendation section.'
                  },
                ],
              },
              options: Options(headers: {
                'Authorization': 'Bearer $apiKey',
                'Content-Type': 'application/json',
                'Content-Length': '<calculated when request is sent>'
              }));
      if (response.statusCode == 200) {
        final data = response.data;
        setState(() {
          gptOutput = data['choices'][0]['message']['content'];
        });
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      print('Error $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget txtField(TextEditingController controller, String label, String hint,
      TextInputType kboardType) {
    return TextField(
      controller: controller,
      keyboardType: kboardType,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }
}
