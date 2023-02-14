class City {
  City({
    required this.id,
    required this.idProvince,
    required this.name,
  });

  String id;
  String idProvince;
  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        idProvince: json["id_provinsi"],
        name: json["name"],
      );
  @override
  String toString() => name;

}
