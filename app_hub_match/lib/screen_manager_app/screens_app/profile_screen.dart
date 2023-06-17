import 'package:app_hub_match/screen_manager_app/screens_app/profile_exchange_screen.dart';
import 'package:flutter/material.dart';
import '../../custom_colors/custom_colors.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().getColorWhite(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors().getColorGreen(),
        leading: IconButton(
          icon: Icon(Icons.settings, color: CustomColors().getColorBlack()),
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
                    radius: 70,
                    backgroundImage: AssetImage('assets/Perfil.png'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 45.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 73, 195, 136),
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 45.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.swap_horiz,
                            color: Color.fromARGB(255, 73, 195, 136),
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileExchangeScreen(),
                              ),
                            );
                          },
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
    );
  }
}
