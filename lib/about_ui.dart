import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ผู้จัดทำ', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E88E5), // สีฟ้าหรือสีตามชอบ
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
              
            ),
            const SizedBox(height: 20),
            const Text('รหัสนักศึกษา: 6852c10006', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('ชื่อ-สกุล: นายนฤชิต เหล่าซื่อสันต์วัฒน์', style: TextStyle(fontSize: 16)),
            const Text('คณะ: ศิลปศาสตร์และวิทยาศาสตร์', style: TextStyle(fontSize: 16)),
            const Text('สาขาวิชา: เทคโนโลยีดิจิตอลและนวัตกรรม', style: TextStyle(fontSize: 16)),

          ],
        ),
      ),
    );
  }
}