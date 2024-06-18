import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:keuangan/page/edit.dart';
import 'package:keuangan/page/pemasukan.dart';
import 'package:keuangan/page/pengeluaran.dart';

class HalamanAwal extends StatefulWidget {
  const HalamanAwal({super.key});

  @override
  State<HalamanAwal> createState() => _HalamanAwalState();
}

class _HalamanAwalState extends State<HalamanAwal> {
  final List<dynamic> _pages = [
    const Pemasukan(),
    const Pengeluaran(),
    const Edit()
  ];

  void _halaman(index) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return _pages[index];
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Iconify(Majesticons.note_text_plus), label: 'Pemasukan'),
            BottomNavigationBarItem(
                icon: Iconify(Majesticons.note_text_minus),
                label: 'Pengeluaran')
          ],
          onTap: _halaman,
        ),
        body: const Column(
          children: [
            Flexible(flex: 4, child: ListData()),
            Flexible(flex: 1, child: Data())
          ],
        ));
  }
}

class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 3, 174, 210),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(color: Colors.red, width: 2)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Beli barang",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("12 Maret 2024")
                      ],
                    ),
                    Text(
                      "-Rp 20.000",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 3, 174, 210),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 104, 210, 232),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Total Saldo",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Rp 200.000",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFF41B06D),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Color(0xFF41B06D)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Pemasukan",
                        style: TextStyle(
                            color: Color(0xFF41B06D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Rp 200.000",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.red,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Pengeluaran",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Rp 200.000",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
