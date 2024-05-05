import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stadi_k_s_u/flutter_flow/flutter_flow_theme.dart';
import 'package:stadi_k_s_u/index.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomeView(),
    const MyReservationView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: FlutterFlowTheme.of(context).secondaryText,
          fill: 0.5,
          size: 30,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (value) => setState(() => currentIndex = value),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
            ),
            label: 'list',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
