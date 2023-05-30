import 'package:app_hub_match/screens/welcome_screen.dart';
import 'package:app_hub_match/values/custom_colors.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _showPassoword = false;
  bool _showTerm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().getColorGreen(),
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
                      "assets/MatchMilhoes.png",
                      height: 250,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
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
                            decoration: InputDecoration(
                              fillColor: Colors.white,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _showTerm,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _showTerm = newValue ?? true;
                            });
                          },
                        ),
                        const Text(
                          "Li e concordo com o termos",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {},
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
