import 'package:flutter/material.dart';
import 'package:test02/facultades.dart';

// Esta función construye el AppBar
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.grey[400], 
    title: Row(
      children: [
        Text(
          'Sede: Sucre',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Spacer(),
        Row(
          children: [
            PopupMenuButton<String>(
              icon: Icon(Icons.menu, color: const Color.fromARGB(255, 34, 30, 30)),
              onSelected: (String result) {
                if (result == 'Facultades') {
                  showFacultadesSubMenu(context);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Facultades',
                  child: Text('Facultades'),
                ),
                PopupMenuItem<String>(
                  value: 'Admisiones',
                  child: Text('Admisiones'),
                ),
              ],
            ),
            SizedBox(width: 10),
            Image.asset(
              'assets/images/upds-azul.png',
              height: 30,
            ),
          ],
        ),
      ],
    ),
  );
}

// Función para mostrar el submenú
void showFacultadesSubMenu(BuildContext context) {
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(100, 100, 0, 0), // Ajusta la posición del submenú
    items: <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: 'Ingeniería de Sistemas',
        child: Text('Ingeniería de Sistemas'),
      ),
      // Agrega más facultades aquí si es necesario
    ],
  ).then((String? result) {
    if (result == 'Ingeniería de Sistemas') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FacultadesPage()), // Cambia a la página correcta
      );
    }
  });
}
