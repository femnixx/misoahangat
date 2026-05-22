import 'package:flutter/material.dart';
import 'package:misoahangat/pages/Beranda.dart';
import 'package:misoahangat/pages/Pesanan.dart';
import 'package:misoahangat/pages/Profil.dart';
import 'package:misoahangat/pages/Voucher.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  int _currentIndex = 0;
  String title = "Homepage";

  final List<Widget> _pages = [
    Beranda(),
    Pesanan(),
    Voucher(),
    Profil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(navComponents[_currentIndex].name)
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: SafeArea(
          child: SizedBox(
            height: 65,
            child: Row(
              children: [
                ...navComponents.map(
                  (items) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                        color: _currentIndex == items.currentIndex ? Color(0xfff8e5e9) : Colors.transparent,
                        child: InkWell(
                          onTap: () => {
                            setState(() {
                                _currentIndex = items.currentIndex;
                            }),
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(items.icon, color: _currentIndex == items.currentIndex ? Color(0xff911b28) : Color(0xffa69ea6)),
                              Text(
                                items.name,
                                style: TextStyle(
                                  color: _currentIndex == items.currentIndex ? Color(0xff911b28) : Color(0xffa69ea6) 
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ) 
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavButtons { 
  String name;
  IconData icon;
  int currentIndex;

  NavButtons({required this.name, required this.icon, required this.currentIndex}); 
}

List<NavButtons> navComponents = [
  NavButtons(name: 'Beranda', icon: Icons.home, currentIndex: 0),
  NavButtons(name: 'Pesanan', icon: Icons.receipt, currentIndex: 1),
  NavButtons(name: 'Voucher', icon: Icons.discount, currentIndex: 2),
  NavButtons(name: 'Profil', icon: Icons.person, currentIndex: 3)
];

