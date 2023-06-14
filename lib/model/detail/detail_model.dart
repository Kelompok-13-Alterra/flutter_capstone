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
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['ID'],
      createdAt: DateTime.parse(json['CreatedAt']),
      updatedAt: DateTime.parse(json['UpdatedAt']),
      name: json['Name'],
      description: json['Description'],
      capacity: json['Capacity'],
      type: json['Type'],
      open: json['Open'],
      close: json['Close'],
      price: json['Price'],
      location: json['Location'],
      facilities: json['Facilities'],
    );
  }
}
