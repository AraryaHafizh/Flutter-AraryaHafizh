import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePageAi extends StatefulWidget {
  const HomePageAi({super.key});

  @override
  State<HomePageAi> createState() => _HomePageAiState();
}

class _HomePageAiState extends State<HomePageAi> {
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
                    'content':
                        'Anda adalah seorang customer service pada suatu universitas. Disini anda bekerja di universitas ITS Surabaya. Sebagai customer service anda harus mencoba menjawab pertanyaan mahasiswa, saya ingin anda menjawb dengan susunan: pembukaan-isi-penutup. untuk pembukaan berikan sapaan kepada mahasiswa dengan nama andi. untuk isi jika anda tidak bisa menjawab pertanyaan mahasiswa maka anda harus me return kalimat yang menyatakan anda tidak bisa menjawab pertanyaan tersebut disertai maaf, atau kata lainnya. Jika dapat menjawab pertanyaan jawablah dengan jelas dan to the point. untuk penutup tolong berikan \'disclaimer\' bahwa ini adalah jawaban yang di generate oleh AI, untuk informasi yang lebih akurat silahkan hubungi cs ITS, sertakan kalimat berikut: \'Kampus ITS Sukolilo - Surabaya\nEmail: humas@its.ac.id\nPhone: 031-5994251-54, 5947274, 5945472\nFax: 031-5923465, 5947845.\'.'
                  },
                  {
                    'role': 'user',
                    'content':
                        'Apa saja persyaratan yang diperlukan untuk mendaftar sebagai mahasiswa baru di Universitas ITS?'
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
