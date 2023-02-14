class Desa {
  Desa({
    required this.id,
    required this.idKec,
    required this.name,
  });

  String id;
  String idKec;
  String name;

  factory Desa.fromJson(Map<String, dynamic> json) => Desa(
        id: json["id"],
        idKec: json["id_kecamatan"],
        name: json["name"],
      );
  @override
  String toString() => name;
}
