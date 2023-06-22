import 'package:flutter/material.dart';
import '../../custom_colors/custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final String nome = 'Arthur';
  bool isFilterOpen = false;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFilterPanel() {
    setState(() {
      isFilterOpen = !isFilterOpen;
      if (isFilterOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _closeFilterPanel() {
    setState(() {
      isFilterOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().getColorWhite(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logosemnome.png',
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Olá, $nome',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Filtre suas buscas de maneira rápida e prática',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Pesquise aqui...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.search),
                        iconSize: 30,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.filter_alt_outlined),
                        iconSize: 30,
                        onPressed: () {
                          _toggleFilterPanel();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Recomendações para você',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColors().getColorGreen(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(),
                        ),
                        // Add info
                        child: Center(
                          child: Text(
                            'Card $index',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          if (isFilterOpen)
            Positioned.fill(
              child: SlideTransition(
                position: _slideAnimation,
                child: GestureDetector(
                  onTap: _closeFilterPanel,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: _closeFilterPanel,
                            iconSize: 35,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 16, top: 8, right: 16),
                          child: const Text(
                            'Perfis',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Startup'),
                          value: false,
                          onChanged: (bool? value) {},
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          title: const Text('Investidor'),
                          value: false,
                          onChanged: (bool? value) {},
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          title: const Text('Mentor'),
                          value: false,
                          onChanged: (bool? value) {},
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          title: const Text('Cientista'),
                          value: false,
                          onChanged: (bool? value) {},
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
