import 'package:app_hub_match/screen_manager_app/screens_app/home_screen.dart';
import 'package:app_hub_match/screen_manager_app/screens_app/profile_screen.dart';
import 'package:flutter/material.dart';
import '../custom_colors/custom_colors.dart';

class ScreenManager extends StatefulWidget {
  const ScreenManager({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenManagerState createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color:
              Colors.white, // Definir a cor de fundo diretamente no Container
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: const [
              Placeholder(),
              HomePage(),
              Placeholder(),
              Placeholder(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: CustomColors().getColorGreen(),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: CustomColors().getColorBlack(),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Filtro',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Match',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.forum),
              label: 'Bate-papo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
