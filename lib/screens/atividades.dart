import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class AtividadesPage extends StatelessWidget {
  final int code;

  const AtividadesPage({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = "Aproveite o seu dia";
    List<Map<String, dynamic>> activities = [];

    if (code >= 0 && code < 600) {
      activities = [
        {"name": "Leitura", "icon": CupertinoIcons.book_fill},
        {"name": "Filmes", "icon": CupertinoIcons.film_fill},
        {"name": "Cinema", "icon": CupertinoIcons.videocam_fill},
        {"name": "Sair com amigos", "icon": CupertinoIcons.person_2_fill},
        {"name": "Jogar Videogame", "icon": CupertinoIcons.game_controller_solid},
      ];
    } else if (code >= 600 && code < 800) {
      activities = [
        {"name": "Montar bonecos de neve", "icon": CupertinoIcons.snow},
        {"name": "Esquiar", "icon": CupertinoIcons.sportscourt_fill},
        {"name": "Patinar no gelo", "icon": CupertinoIcons.thermometer_snowflake},
      ];
    } else if (code >= 800) {
      activities = [
        {"name": "Piscina", "icon": CupertinoIcons.sun_dust_fill},
        {"name": "Piquenique", "icon": CupertinoIcons.tree},
        {"name": "Acampar", "icon": CupertinoIcons.house_alt_fill},
        {"name": "Passeio de bicicleta", "icon": CupertinoIcons.arrow_up_arrow_down_circle_fill},
        {"name": "Futebol", "icon": CupertinoIcons.sportscourt_fill},
      ];
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: Colors.white), // Adicionado aqui para mudar a cor da seta de retorno
        title: Text(title, style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
        child: Column(
          children: [
            Text(
              "Escolha uma atividade para o seu dia:",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Icon(
                        activities[index]["icon"],
                        color: Colors.white,
                      ),
                      title: Text(
                        activities[index]["name"],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AtividadesPage(code: 750), // Código de exemplo
    theme: ThemeData.dark(),
  ));
}

