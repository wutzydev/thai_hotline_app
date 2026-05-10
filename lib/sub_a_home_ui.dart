import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUI extends StatefulWidget {
  const SubAHomeUI({super.key});

  @override
  State<SubAHomeUI> createState() => _SubAHomeUIState();
}

class _SubAHomeUIState extends State<SubAHomeUI> {
  final Color themeColor = const Color(0xFF6D4C41); // สีน้ำตาล

  final List<Map<String, String>> hotlines = [
    {'name': 'กรมทางหลวงชนบท', 'number': '1146', 'image': '1146.png'},
    {'name': 'ตำรวจท่องเที่ยว', 'number': '1155', 'image': '1155.png'},
    {'name': 'ตำรวจทางหลวง', 'number': '1193', 'image': '1193.png'},
    {'name': 'ข้อมูลจราจร', 'number': '1197', 'image': '1197.jpg'},
    {'name': 'ขสมก.', 'number': '1348', 'image': '1348.png'},
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5), // สีพื้นหลังเทาอ่อน
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'สายด่วน\nการเดินทาง',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: themeColor),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: themeColor.withOpacity(0.2), blurRadius: 20, spreadRadius: 2),
              ],
            ),
            child: Icon(Icons.directions_car, size: 50, color: themeColor),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: hotlines.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/${hotlines[index]['image']}',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(width: 50, height: 50, color: Colors.grey.shade300),
                      ),
                    ),
                    title: Text(hotlines[index]['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    subtitle: Text(hotlines[index]['number']!, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                    trailing: InkWell(
                      onTap: () => _makePhoneCall(hotlines[index]['number']!),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.green.shade50, shape: BoxShape.circle),
                        child: const Icon(Icons.call, color: Colors.green),
                      ),
                    ),
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