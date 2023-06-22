import 'package:app_hub_match/screen_manager_app/screen_manager.dart';
import 'package:flutter/material.dart';
import '../custom_colors/custom_colors.dart';

class SelectionProfileScreen extends StatefulWidget {
  const SelectionProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SelectionProfileScreenState createState() => _SelectionProfileScreenState();
}

class ButtonData {
  final String selectedProfile;

  ButtonData({required this.selectedProfile});
}

class _SelectionProfileScreenState extends State<SelectionProfileScreen> {
  List<ButtonData> buttons = [];
  String selectedProfile = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().getColorGreen(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              width: constraints.maxWidth * .9,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 45,
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          showProfileSelectionMenu();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: buttons
                        .map(
                          (buttonData) => Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  navigateToOtherScreen(context);
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      getImagePathForProfile(
                                          buttonData.selectedProfile),
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      buttonData.selectedProfile,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showProfileSelectionMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecione um Perfil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Investidor'),
                onTap: () {
                  selectProfile('Investidor');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Startup'),
                onTap: () {
                  selectProfile('Startup');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Cientista'),
                onTap: () {
                  selectProfile('Cientista');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Mentor'),
                onTap: () {
                  selectProfile('Mentor');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void selectProfile(String profile) {
    setState(() {
      selectedProfile = profile;
      buttons.add(ButtonData(selectedProfile: profile));
    });
  }

  String getImagePathForProfile(String profile) {
    switch (profile) {
      case 'Investidor':
        return 'assets/Perfil.png';
      case 'Startup':
        return 'assets/Perfil1.png';
      case 'Cientista':
        return 'assets/Perfil2.png';
      case 'Mentor':
        return 'assets/Perfil3.png';
      default:
        return '';
    }
  }

  void navigateToOtherScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          // ignore: prefer_const_constructors
          builder: (context) => ScreenManager()),
    );
  }
}
