import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUI extends StatefulWidget {
  const SubBHomeUI({super.key});

  @override
  State<SubBHomeUI> createState() => _SubBHomeUIState();
}

class _SubBHomeUIState extends State<SubBHomeUI> {
  final Color themeColor = const Color(0xFFE53935); // สีแดง

  final List<Map<String, String>> hotlines = [
    {'name': 'เหตุด่วนเหตุร้าย', 'number': '191', 'image': '191.png'},
    {'name': 'แจ้งไฟไหม้ สัตว์เข้าบ้าน', 'number': '199', 'image': '199.png'},
    {'name': 'สายด่วนรถหาย', 'number': '1192', 'image': '1192.jpg'},
    {'name': 'อุบัติเหตุทางน้ำ', 'number': '1196', 'image': '1196.jpg'},
    {'name': 'แจ้งคนหาย', 'number': '1300', 'image': '1300.png'},
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
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
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
            // ไอคอนกล่องพยาบาล
            child: Icon(Icons.medical_services, size: 50, color: themeColor),
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