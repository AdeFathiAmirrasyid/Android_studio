class Kecamatan {
  Kecamatan({
    required this.id,
    required this.idKab,
    required this.name,
  });

  String id;
  String idKab;
  String name;

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        id: json["id"],
        idKab: json["id_kabupaten"],
        name: json["name"],
      );
  @override
  String toString() => name;
}
