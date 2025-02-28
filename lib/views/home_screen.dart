import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';
import '../models/home_model.dart'; // OrderType을 사용하기 위해 추가

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key); // key 추가

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('음식점 배달·포장 앱', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF8E44AD), // 보라색 포인트 컬러
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // 검색 기능 추가 예정
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      homeProvider.setOrderType(OrderType.delivery),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E44AD)),
                  child:
                      const Text('배달', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => homeProvider.setOrderType(OrderType.pickup),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E44AD)),
                  child:
                      const Text('포장', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: homeProvider.restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = homeProvider.restaurants[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[300], // 가게 이미지 자리
                    ),
                    title: Text(restaurant.name),
                    subtitle: Text(
                        '${restaurant.category}, ${restaurant.orderType == OrderType.delivery ? "배달 가능" : "포장 가능"}'),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      // 가게 상세 페이지 이동 기능 추가 예정
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
