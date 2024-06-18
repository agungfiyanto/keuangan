class DataModel {
  int? id, nominal;
  String? keterangan, kategori;
  DateTime? tanggal;

  DataModel(
      {this.id, this.nominal, this.keterangan, this.kategori, this.tanggal});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        id: json['id'],
        nominal: json['harga_barang'],
        keterangan: json['keterangan'],
        kategori: json['kategori'],
        tanggal: json['tanggal']);
  }

  @override
  String toString() {
    return '{"id": "$id", "nominal": "$nominal", "keterangan": "$keterangan"}, "kategori": "$kategori", "tanggal": "$tanggal';
  }
}
