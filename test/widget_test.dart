
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const aplikasiBilangan());
}

class aplikasiBilangan extends StatelessWidget {
  const aplikasiBilangan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<double> bilangan = [];
  double hasil = 0;

  TextEditingController conbilangan1 = TextEditingController();
  TextEditingController conbilangan2 = TextEditingController();
  TextEditingController conbilangan3 = TextEditingController();
  TextEditingController conbilangan4 = TextEditingController();
  TextEditingController conbilangan5 = TextEditingController();
  TextEditingController conhasil = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Bilangan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 20,
          children: [
            TextField(
              controller: conbilangan1,
              decoration: const InputDecoration(
                label: Text("Bilangan 1"),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: conbilangan2,
              decoration: const InputDecoration(
                label: Text("Bilangan 2"),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: conbilangan3,
              decoration: const InputDecoration(
                label: Text("Bilangan 3"),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: conbilangan4,
              decoration: const InputDecoration(
                label: Text("Bilangan 4"),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: conbilangan5,
              decoration: const InputDecoration(
                label: Text("Bilangan 5"),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      hitung(bilangan: bilangan, operasi: "Total");
                    },
                    child: Text("Total"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      hitung(bilangan: bilangan, operasi: "Rata2");
                    },
                    child: Text("Rata2"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      hitung(bilangan: bilangan, operasi: "Besar");
                    },
                    child: Text("Terbesar"),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      hitung(bilangan: bilangan, operasi: "Kecil");
                    },
                    child: Text("Terkecil"),
                  ),
                ),
              ],
            ),
            TextField(
              controller: conhasil,
              decoration: const InputDecoration(
                label: Text("Hasil"),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      conbilangan1.text = "";
                      conbilangan2.text = "";
                      conbilangan3.text = "";
                      conbilangan4.text = "";
                      conbilangan5.text = "";
                      conhasil.text = "";
                      bilangan.clear();
                      bilangan = [];
                    },
                    child: Text("KOSONGKAN"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void hitung({required List<double> bilangan, required String operasi}) {
    double bil1 = double.parse(conbilangan1.text);
    double bil2 = double.parse(conbilangan2.text);
    double bil3 = double.parse(conbilangan3.text);
    double bil4 = double.parse(conbilangan4.text);
    double bil5 = double.parse(conbilangan5.text);
    bilangan.add(bil1);
    bilangan.add(bil2);
    bilangan.add(bil3);
    bilangan.add(bil4);
    bilangan.add(bil5);

    double hasilHit = 0;
    switch (operasi) {
      case "Total":
        hasilHit = bilangan.reduce((value, element) => value + element);
        break;
      case "Rata2":
        hasilHit = bilangan.reduce((value, element) => value + element) /
            bilangan.length;
        break;
      case "Besar":
        hasilHit = bilangan
            .reduce((value, element) => value > element ? value : element);
        break;
      case "Kecil":
        hasilHit = bilangan
            .reduce((value, element) => value < element ? value : element);
        break;
      default:
    }
    conhasil.text = hasilHit.toString();
  }
}