class Destination {
  final int id;
  final String destinationName;
  final String description;
  final String region;
  final String city;
  final String transportRecomendation;
  final String picture;
  final int price;

  Destination(
      {required this.id,
      required this.destinationName,
      required this.description,
      required this.region,
      required this.city,
      required this.transportRecomendation,
      required this.picture,
      required this.price});

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'] ?? 0,
      destinationName: json['destination_name'] ?? '',
      description: json["description"] ?? '',
      region: json["region"] ?? '',
      city: json["city"] ?? '',
      transportRecomendation: json["transport_recomendation"] ?? '',
      picture: json["picture"] ?? '',
      price: json["price"] ?? 0,
    );
  }
}
