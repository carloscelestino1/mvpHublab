import 'package:app_hub_match/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../custom_colors/custom_colors.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    const Text(
                      "Bem-Vindo !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    const Text(
                      'A nossa platarforma Hub Match te ajuda a encontrar os melhores parceiros que façam sentido para o seu négocio .',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Image.asset(
                      "assets/Welcome.png",
                      height: 330,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Text(
                            "Cadastra-se",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
}
