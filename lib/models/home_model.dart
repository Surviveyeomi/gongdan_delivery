//lib/models/home_model.dart
class Restaurant {
  final String name;
  final String category;
  final OrderType orderType;

  Restaurant({
    required this.name,
    required this.category,
    required this.orderType,
  });
}

enum OrderType { delivery, pickup }
