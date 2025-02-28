//lib/providers/home_provider.dart
import 'package:flutter/material.dart';
import '../models/home_model.dart';

class HomeProvider extends ChangeNotifier {
  OrderType _orderType = OrderType.delivery; // 기본값: 배달
  List<Restaurant> _restaurants = [
    Restaurant(name: '한식당', category: '한식', orderType: OrderType.delivery),
    Restaurant(name: '중식당', category: '중식', orderType: OrderType.pickup),
    Restaurant(name: '양식당', category: '양식', orderType: OrderType.delivery),
  ];

  OrderType get orderType => _orderType;
  List<Restaurant> get restaurants =>
      _restaurants.where((r) => r.orderType == _orderType).toList();

  void setOrderType(OrderType type) {
    _orderType = type;
    notifyListeners(); // UI 업데이트
  }

  void addRestaurant(Restaurant restaurant) {
    _restaurants.add(restaurant);
    notifyListeners();
  }
}
