import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUI extends StatefulWidget {
  const SubCHomeUI({super.key});

  @override
  State<SubCHomeUI> createState() => _SubCHomeUIState();
}

class _SubCHomeUIState extends State<SubCHomeUI> {
  final Color themeColor = const Color(0xFF1E88E5); // สีฟ้า

  final List<Map<String, String>> hotlines = [
    {'name': 'ธนาคารกรุงเทพ', 'number': '1333', 'image': '1333v2.jpg'},
    {'name': 'ออมสิน', 'number': '1115', 'image': '1115.png'},
    {'name': 'ธนาคารกสิกรไทย', 'number': '02 888 8888', 'image': '028888888.png'},
    {'name': 'ธนาคารกรุงไทย', 'number': '02 111 1111', 'image': '021111111.png'},
  ];
  Future<void> _makePhoneCall(String phoneNumber) async {
    // ลบช่องว่างออกก่อนโทร
    final cleanNumber = phoneNumber.replaceAll(' ', '');
    final Uri launchUri = Uri(scheme: 'tel', path: cleanNumber);
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
            'สายด่วน\nธนาคาร',
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
            child: Icon(Icons.account_balance, size: 50, color: themeColor),
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