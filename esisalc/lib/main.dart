import 'package:flutter/material.dart';

void main() {
  runApp(PartyGameApp());
}

class PartyGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party Game App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Liste des pages de l'application
  static List<Widget> _pages = <Widget>[
    DrinkCounterPage(),  // Page du compteur de verres
    RulesPage(),         // Page des règles
    SettingsPage(),      // Page des paramètres
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Party Game App'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_bar),
            label: 'Compteur de verres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Règles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple.shade700,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DrinkCounterPage extends StatefulWidget {
  @override
  _DrinkCounterPageState createState() => _DrinkCounterPageState();
}

class _DrinkCounterPageState extends State<DrinkCounterPage> {
  int _drinkCount = 0;  // Le compteur de verres

  // Fonction pour incrémenter le compteur de verres
  void _incrementDrinkCount() {
    setState(() {
      _drinkCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.local_bar,
            size: 48,
            color: Colors.deepPurple.shade700,
          ),
          SizedBox(height: 20),
          Text(
            '$_drinkCount',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade700),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _incrementDrinkCount,
            child: Icon(Icons.plus_one),
          ),
        ],
      ),
    );
  }
}

class RulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Règles du jeu:\n\n1. Faites ceci.\n2. Faites cela.\n3. Amusez-vous !',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Paramètres du jeu',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
