import 'package:desafio_mooney/widgets/elevated_button.dart';
import 'package:desafio_mooney/widgets/select_user_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelectedAdult = false;
  bool isSelectedTeen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF0d123a),
                Color(0xFF160b2f),
              ]),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.arrow_back_ios_new, color: Colors.white),
                      SizedBox(width: 20),
                      Text('Voltar',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Criar conta como:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          isSelectedAdult = !isSelectedAdult;
                          isSelectedAdult ? isSelectedTeen = false : null;
                        }),
                        child: SelectUserCard(
                          imagePath: 'assets/mulher.png',
                          subtitle: 'Que vai acompanhar a educação de um jovem',
                          title: 'Adulto',
                          isSelected: isSelectedAdult,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          isSelectedTeen = !isSelectedTeen;
                          isSelectedTeen ? isSelectedAdult = false : null;
                        }),
                        child: SelectUserCard(
                          imagePath: 'assets/menino.png',
                          subtitle:
                              'Que vai aprender a administrar o seu dinheiro',
                          title: 'Jovem',
                          isSelected: isSelectedTeen,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                bottom: 0,
                child: MyElevatedButton(
                  width: double.infinity,
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(15),
                  child: const Text(
                    'Avançar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
