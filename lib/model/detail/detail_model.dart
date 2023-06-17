class DetailModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final int capacity;
  final String type;
  final String open;
  final String close;
  final int price;
  final String location;
  final String facilities;
  String? deletedAt;

  DetailModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.capacity,
    required this.type,
    required this.open,
    required this.close,
    required this.price,
    required this.location,
    required this.facilities,
    this.deletedAt,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['ID'] ?? 0,
      createdAt: DateTime.parse(json['CreatedAt']),
      updatedAt: DateTime.parse(json['UpdatedAt']),
      name: json['Name'] ?? '',
      description: json['Description'] ?? '',
      capacity: json['Capacity'] ?? 0,
      type: json['Type'] ?? '',
      open: json['Open'] ?? '',
      close: json['Close'] ?? '',
      price: json['Price'] ?? 0,
      location: json['Location'] ?? '',
      facilities: json['Facilities'] ?? '',
      deletedAt: json['DeletedAt'],
    );
  }
}
