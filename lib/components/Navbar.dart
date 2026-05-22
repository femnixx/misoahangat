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
        title: Text(title),
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
                    child: Material(
                      color: _currentIndex == items.currentIndex ? Colors.red : Colors.transparent,
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
                            Icon(items.icon, color: Colors.redAccent),
                            Text(
                              items.name,
                              style: TextStyle(
                                color: Colors.redAccent
                              ),
                            )
                          ],
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

