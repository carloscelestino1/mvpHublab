import 'package:app_hub_match/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import '../values/custom_colors.dart';

class ProfileScreenPage extends StatefulWidget {
  const ProfileScreenPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenPageState createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().getWhiteColor(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors().getColorGreen(),
        leading: IconButton(
          icon: Icon(Icons.settings, color: CustomColors().getBlackColor()),
          onPressed: () {
            // ignore: avoid_print
            print('Botão de Configuração Pressionado');
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              width: constraints.maxWidth * .9,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/Perfil.png'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const APage()));
                          },
                        ),
                      ),
                      const Text(
                        'Editar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: CustomColors().getColorGreen(),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: CustomColors().getBlackColor(),
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
