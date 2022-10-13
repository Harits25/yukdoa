class DetailModel {
  final int id;
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;

  const DetailModel(
      {required this.id,
      required this.doa,
      required this.ayat,
      required this.latin,
      required this.artinya});

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'] as int,
      doa: json['doa'] as String,
      ayat: json['ayat'] as String,
      latin: json['latin'] as String,
      artinya: json['artinya'] as String,
    );
  }
}
