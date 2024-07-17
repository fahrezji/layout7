import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _panjang = 0;
  int _lebar = 0;
  int _luas = 0; // Menambah variabel untuk menyimpan nilai luas

  final panjang = TextEditingController();
  final lebar = TextEditingController();

  void _setCounter() {
    setState(() {
      // Parsing nilai dari TextEditingController
      int panjangValue = int.tryParse(panjang.text) ?? 0;
      int lebarValue = int.tryParse(lebar.text) ?? 0;

      // Melakukan perhitungan luas
      _luas = panjangValue * lebarValue;

      // Mengatur nilai pada TextEditingController
      panjang.text = '$panjangValue';
      lebar.text = '$lebarValue';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Layout7"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: panjang,
                ),
                TextField(
                  controller: lebar,
                ),
                const SizedBox(height: 10),
                Text(
                  // Menyesuaikan teks untuk menampilkan nilai luas yang benar
                  'Luas = $_luas',
                  style: const TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Memanggil fungsi perhitungan
                    _setCounter();
                  },
                  child: const Text('Hitung'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
