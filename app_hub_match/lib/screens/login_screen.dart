import 'dart:convert';

import 'package:app_hub_match/screen_manager_app/screen_manager.dart';
import 'package:http/http.dart' as http;

import 'package:app_hub_match/screens/forgot_password_screen.dart';
import 'package:app_hub_match/screens/welcome_screen.dart';
import 'package:app_hub_match/custom_colors/custom_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassoword = false;

  final _emailcontroller = TextEditingController();
  final _senhacontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().getColorWhite(),
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
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/HubMatchLogo.png",
                      height: 250,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: MaterialButton(
                                color: CustomColors().getColorGreen(),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                onPressed: () {},
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.g_mobiledata,
                                        color: CustomColors().getColorWhite(),
                                        size: 50,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        "Entrar com o Google",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailcontroller,
                            decoration: const InputDecoration(
                              fillColor: Colors.white54,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _senhacontroller,
                            decoration: InputDecoration(
                              fillColor: Colors.white54,
                              filled: true,
                              border: const OutlineInputBorder(),
                              labelText: "Senha",
                              labelStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassoword == false
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  setState(() {
                                    _showPassoword = !_showPassoword;
                                  });
                                },
                              ),
                            ),
                            obscureText: _showPassoword == false ? true : false,
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors().getColorGreen(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          logar();
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                    ),
                    GestureDetector(
                      // ignore: avoid_print
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassaword()));
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Esqueceu a senha? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Clique aqui',
                              style: TextStyle(
                                color: CustomColors().getColorGreen(),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  logar() async {
    var url = Uri.parse(
        "https://8ca4-179-34-116-254.ngrok-free.app/usuarios/usuarios/");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    // ignore: avoid_print
    print(data);

    for (var i in data) {
      var userEmail = i['email'];
      var userPassword = i['senha'];

      if (userEmail == _emailcontroller.text &&
          userPassword == _senhacontroller.text) {
        // Salvar os dados do usuário ou realizar quaisquer ações necessárias aqui

        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ScreenManager()));

        return; // Sair da função após autenticação bem-sucedida
      }
    }

    // Caso o loop seja concluído sem encontrar um usuário correspondente
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro de autenticação'),
          content: const Text('Email ou senha incorretos.'),
          actions: [
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
