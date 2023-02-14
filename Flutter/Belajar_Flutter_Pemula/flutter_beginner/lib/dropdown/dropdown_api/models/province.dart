class Province {
  String id;
  String name;

  Province({required this.id, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) =>
      Province(id: json['id'], name: json['name']);

  @override
  String toString() => name;
}
