import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubDHomeUI extends StatefulWidget {
  const SubDHomeUI({super.key});

  @override
  State<SubDHomeUI> createState() => _SubDHomeUIState();
}

class _SubDHomeUIState extends State<SubDHomeUI> {
  final Color themeColor = const Color(0xFFFF8F00); // สีส้ม

  final List<Map<String, String>> hotlines = [
    {'name': 'ไฟฟ้านครหลวง', 'number': '1130', 'image': '1130.png'},
    {'name': 'ไฟฟ้าส่วนภูมิภาค', 'number': '1129', 'image': '1129.png'},
    {'name': 'ไฟฟ้าฝ่ายผลิต', 'number': '1416', 'image': '1416.png'},
    {'name': 'การประปานครหลวง', 'number': '1125', 'image': '1125.png'},
    {'name': 'การประปาส่วนภูมิภาค', 'number': '1662', 'image': '1162.png'}, 
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
            'สายด่วน\nสาธารณูปโภค',
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
            child: Icon(Icons.lightbulb_outline, size: 50, color: themeColor),
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