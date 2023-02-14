class Tmdb {
  Tmdb({
    required this.arti,
    required this.asma,
    required this.ayat,
    required this.keterangan,
    required this.nama,
    required this.urut,
    required this.type,
  });
  String arti;
  String asma;
  int ayat;
  String keterangan;
  String nama;
  String type;
  String urut;

  factory Tmdb.fromJson(Map<String, dynamic> json) => Tmdb(
      arti: json['arti'],
      asma: json['asma'],
      ayat: json['ayat'],
      keterangan: json['keterangan'],
      nama: json['nama'],
      urut: json['urut'],
      type: json['type']);
}
