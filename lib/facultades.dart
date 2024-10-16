import 'package:flutter/material.dart';
import 'navbar.dart'; // Importa el archivo con el AppBar

class FacultadesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context), // Reutilizamos el AppBar
      body: Center(
        child: Text(
          'Aquí se mostrarán las facultades de Ingeniera de sistemas',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
