import 'package:desafio_mooney/commons/gradient_button.dart';
import 'package:desafio_mooney/theme/dark.dart';
import 'package:desafio_mooney/widgets/select_user_card.dart';
import 'package:flutter/material.dart';

enum UserCards {
  nenhum,
  adulto,
  teen,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserCards selectedUserCard = UserCards.nenhum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: DarkTheme.secondaryGradient,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Voltar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Criar conta como:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SelectUserCard(
                        imagePath: 'assets/mulher.png',
                        subtitle: 'Que vai acompanhar a educação de um jovem',
                        title: 'Adulto',
                        isSelected: selectedUserCard == UserCards.adulto,
                        onTap: () {
                          setState(() {
                            if (selectedUserCard == UserCards.adulto) {
                              selectedUserCard = UserCards.nenhum;
                            } else {
                              selectedUserCard = UserCards.adulto;
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SelectUserCard(
                        imagePath: 'assets/menino.png',
                        subtitle: 'Que vai aprender a administrar o seu dinheiro',
                        title: 'Jovem',
                        isSelected: selectedUserCard == UserCards.teen,
                        onTap: () {
                          setState(() {
                            if (selectedUserCard == UserCards.teen) {
                              selectedUserCard = UserCards.nenhum;
                            } else {
                              selectedUserCard = UserCards.teen;
                            }
                          });
                        },
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
              child: MyGradientButton(
                active: selectedUserCard != UserCards.nenhum,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
