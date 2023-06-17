import 'package:app_hub_match/screens/login_screen.dart';
import 'package:app_hub_match/custom_colors/custom_colors.dart';
import 'package:flutter/material.dart';

class ForgotPassaword extends StatefulWidget {
  const ForgotPassaword({super.key});

  @override
  State<ForgotPassaword> createState() => _ForgotPassawordState();
}

class _ForgotPassawordState extends State<ForgotPassaword> {
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
                                  builder: (context) => const LoginScreen()));
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
                      "assets/ForgotPassaword.png",
                      height: 250,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Digite o seu e-mail que e o código de recuperação de senha irá chegar nele.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                          "Confirmar",
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
                    const Text(
                      "Após confirmar aguarde o e-mail...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
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
