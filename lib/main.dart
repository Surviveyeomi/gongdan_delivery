//lib/main.dart
import 'package:flutter/material.dart';
import 'package:gongdan_delivery/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '배달·포장 주문 앱',
        theme: ThemeData(
          primaryColor: Color(0xFF8E44AD),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
