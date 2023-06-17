import 'package:flutter/material.dart';
import '../../custom_colors/custom_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: SingleChildScrollView(
              child: Container(
                width: constraints.maxWidth * .9,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      "assets/PerfilUp.png",
                      height: 150,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Nome",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Seguimento",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Proposito",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Vídeo de apresentação url",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Pdf pitch url",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors().getColorGreen(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Concluir",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
