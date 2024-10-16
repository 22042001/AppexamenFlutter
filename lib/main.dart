import 'package:flutter/material.dart';
import 'facultades.dart'; // Asegúrate de que esta ruta sea correcta para tu archivo de facultades
import 'navbar.dart'; // Importa el archivo donde está el AppBar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPDS App',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context), // Usamos el AppBar reutilizable
      body: ListView(
        children: [
          // Contenedor con la imagen principal
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'assets/images/portada-web.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Contenedor con las opciones
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            color: const Color.fromARGB(255, 211, 205, 205),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Opción 1: Mapas
                  optionItem(Icons.map, 'Mapas'),
                  // Opción 2: Social
                  optionItem(Icons.people, 'Social'),
                  // Opción 3: Tour Virtual
                  optionItem(Icons.vrpano, 'Tour Virtual'),
                  // Opción 4: Portal UPDS
                  optionItem(Icons.web, 'Portal UPDS'),
                  // Opción 5: Biblioteca
                  optionItem(Icons.menu_book, 'Biblioteca'),
                ],
              ),
            ),
          ),
          // Contenedor con el título "Últimas Noticias" y color de fondo
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 38, 102, 231), // Color de fondo
            child: Text(
              'Últimas Noticias',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 245, 244, 244), // Color del texto para contraste
              ),
            ),
          ),
          // Tarjetas de noticias
          newsCard(
            'assets/images/1.jpeg',
            '“Mujeres de Madera”, un homenaje a la fortaleza femenina en Bolivia',
            'En un emotivo acto por el mes de la mujer boliviana, la vicepresidente del Directorio, Ing. Norma Pacheco, y la Rectora de la UPDS Sede Tarija, Lic. María Virginia Ruiz, estuvieron presentes en la ina',
          ),
          newsCard(
            'assets/images/bolivia-arde.jpg',
            'UPDS suspende su aniversario para convertirse en centro de acopio y ayudar a combatir los incendios en Bolivia',
            'Todo el presupuesto que se tenía destinado para los festejos será donado en su totalidad a los bomberos voluntarios. En medio de uno de los momentos más críticos para Bolivia, con incendios devasta…',
          ),
          // Agrega más tarjetas si es necesario
          // Footer
          footerSection(),
        ],
      ),
    );
  }

  // Widget para las opciones en el menú horizontal
  Widget optionItem(IconData iconData, String text) {
    return Container(
      width: 80, // Ajusta el ancho según sea necesario
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, size: 40, color: const Color.fromARGB(255, 43, 45, 46)),
          SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  // Widget para las tarjetas de noticias
  Widget newsCard(String imagePath, String title, String description) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen de la noticia
          Image.asset(
            imagePath,
            fit: BoxFit.cover, // Carga la imagen y cubre todo el ancho de la card
            width: double.infinity,
            height: 150,
          ),
          // Contenido de la tarjeta
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para el footer
  Widget footerSection() {
    return Container(
      color: const Color.fromARGB(255, 36, 68, 231), // Color de fondo opcional
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Imagen centrada
          Center(
            child: Image.asset(
              'assets/images/logo_trans.png', // Ruta de la imagen del footer
              width: 100, // Ajusta el tamaño según sea necesario
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 16.0),
          // Subtítulo
          Text(
            'Información de Contacto',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          // Detalles de contacto
          contactInfoItem(Icons.location_on, 'Sucre, Dirección'),
          contactInfoItem(Icons.phone, 'Teléfono: (591-4) 646-2625'),
          contactInfoItem(Icons.email, 'Correo: infoupds.sucre@upds.edu.bo'),
        ],
      ),
    );
  }

  // Widget para cada elemento de información de contacto
  Widget contactInfoItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 40, 40, 41)),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
