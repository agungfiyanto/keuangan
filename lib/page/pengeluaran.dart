import 'package:flutter/material.dart';

class Pengeluaran extends StatelessWidget {
  const Pengeluaran({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(children: [Background(), Foreground()]),
    ));
  }
}

class Background extends StatelessWidget {
  Background({super.key});

  @override
  Widget build(BuildContext context) {
    double tinggiMargin = MediaQuery.of(context).size.height * 0.15;
    return Container(
        margin: EdgeInsets.only(top: tinggiMargin),
        width: double.infinity,
        child: Column(
          children: [],
        ));
  }
}

class Foreground extends StatefulWidget {
  TextEditingController _dateController = TextEditingController();

  @override
  _ForegroundState createState() => _ForegroundState();
}

class _ForegroundState extends State<Foreground> {
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        widget._dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightBody = MediaQuery.of(context).size.height;
    double bodyAtas = heightBody / 4.8;
    double bodyBawah = heightBody - bodyAtas;

    return Column(
      children: [
        SizedBox(
          height: bodyAtas,
          width: double.infinity,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, -5)),
                ]),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 80, 80),
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(10),
                          left: Radius.circular(10),
                        )),
                    child: Text(
                      "Pengeluaran",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 35, 20, 50),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 216, 221, 218),
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(20),
                          left: Radius.circular(20),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Tambahkan Uang',
                            hintText: 'Tulis Jumlah Uang...',
                            prefixIcon: Icon(Icons.paid),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Tambahkan Keterangan',
                            hintText: 'Tulis Keterangan...',
                            prefixIcon: Icon(Icons.text_fields),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 150, // Atur lebar TextField
                          height: 60, // Atur tinggi TextField
                          child: TextField(
                            controller: widget._dateController,
                            decoration: InputDecoration(
                              labelText: 'Tanggal',
                              filled: true,
                              prefixIcon: Icon(Icons.calendar_today),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                            readOnly: true,
                            onTap: _selectDate,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Keluar",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Simpan",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
