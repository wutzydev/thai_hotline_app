import 'package:flutter/material.dart';
import 'sub_a_home_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_c_home_ui.dart';
import 'sub_d_home_ui.dart';
import 'about_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SubAHomeUI(),
    const SubBHomeUI(),
    const SubCHomeUI(),
    const SubDHomeUI(),
  ];

  // กำหนดสีของ AppBar ตามหมวดหมู่ (0: น้ำตาล, 1: แดง, 2: ฟ้า, 3: ส้ม)
  final List<Color> _appBarColors = [
    const Color(0xFF795548), 
    const Color(0xFFE53935), 
    const Color(0xFF1E88E5), 
    const Color(0xFFFF8F00), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appBarColors[_selectedIndex],
        title: const Text('สายด่วน THAILAND', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUI()));
            },
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: _appBarColors[_selectedIndex],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'การเดินทาง'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'อุบัติเหตุ-เหตุฉุกเฉิน'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'ธนาคาร'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'สาธารณูปโภค'),
        ],
      ),
    );
  }
}