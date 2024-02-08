import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'App Store Simulation',
      home: AppStoreScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppStoreScreen extends StatelessWidget {
  const AppStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
      //buscador o separacion de vistas 
      tabBuilder: (BuildContext context, int index) {
        late Widget targetPage;
        switch (index) {
          case 0:
            targetPage = const SearchPage();
            break;
          case 1:
            targetPage = const HomeScreen();
            break;
          case 2:
            targetPage = const CartPage();
            break;
          default:
            targetPage = const HomeScreen();
            break;
        }
        return CupertinoTabView(builder: (BuildContext context) {
          return CupertinoPageScaffold(
            child: targetPage,
          );
        });
      },
    );
  }
}
// aqui hace el funcionamiento de las dos vista funcionales 

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Apps'),
      ),
      child: ListView(
        children: const <Widget>[
          LargeImageCard(),
          CupertinoListTile('Twither', '', Icons.apps),
          CupertinoListTile('Camara', '', Icons.camera),
          CupertinoListTile('Messenger', '', Icons.message),
          CupertinoListTile(' Mi musica Favorita', '', Icons.music_note),
          CupertinoListTile('Google Maps', '', Icons.map),
          CupertinoListTile('contactos de emergencia', '', Icons.contact_emergency),
          SmallImageCard(),
          SmallImageCard(),
          LargeImageCard(),
          CupertinoListTile('Email', '', Icons.email),
          CupertinoListTile('Tienda', '', Icons.add_business),
          CupertinoListTile('Biblioteca', '', Icons.book),
          CupertinoListTile('Calendario', '', Icons.calendar_today),
          CupertinoListTile('Drive', '', Icons.add_to_drive),
          CupertinoListTile('Clima', '', Icons.air_rounded),
          SmallImageCard(),
          // todos los iconos de la apps 
        ],
      ),
    );
  }
}

class LargeImageCard extends StatelessWidget {
  const LargeImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8.0,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage('imagenes/imagess/gatito.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage('lib/images/shein.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//imagenes de implemntacion en la vista de Home
class SmallImageCard extends StatelessWidget {
  const SmallImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: NetworkImage('https://acf.geeknetic.es/imagenes/noticias/2019/17850-twitter-imagenes-jpg-alta-calidad-muestra.jpg'),
              
            ),
            
          ),
        ),
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final String appNombre;
  final String appDescripcion;
  final IconData iconos;

  const CupertinoListTile(this.appNombre, this.appDescripcion, this.iconos,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {},
                  child: const Text(
                    'Get',
                    style: TextStyle(color: Color.fromARGB(255, 255, 38, 0)),
                  ),
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appNombre,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      appDescripcion,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(iconos),
          ],
        ),
      ),
    );
  }
}
//estilos de los iconos y colores de los textos en la vista de Search

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Page'),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cart Page'),
    );
  }
}