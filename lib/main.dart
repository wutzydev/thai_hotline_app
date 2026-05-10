import 'package:flutter/material.dart';
import 'splash_screen_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thai Hotline App',
      theme: ThemeData(
        fontFamily: 'Kanit', // แนะนำให้ลงฟอนต์ Kanit หรือ Prompt ใน pubspec.yaml เพื่อความสวยงาม
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // สีพื้นหลังเทาอ่อนๆ ตามดีไซน์
      ),
      home: const SplashScreenUI(),
    );
  }
}