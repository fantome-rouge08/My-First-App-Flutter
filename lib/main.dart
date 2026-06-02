import 'package:flutter/material.dart';
import '/pages/accueil.dart';
import '/pages/a-propos.dart';
import '/pages/groupe.dart';
import '/pages/messes.dart';
import '/pages/agenda.dart';
import '/pages/contacts.dart';
void main() {
  runApp(const MyApp());
}

/// Widget racine de votre application qui configure le thème global
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paroisse Saint Léonard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true, // Active les composants modernes de Material 3
      ),
      home: const NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  // Index de la page actuellement affichée dans la NavigationBar
  int _pageIndex = 0;

  // Liste des pages principales associées à la barre du bas
  final List<Widget> _pages = [
    HomeScreen(),
    AProposPage(),
    GroupesPage(),
    MessePage()
  ];

  // Fonction utilitaire pour ouvrir une page en dehors de la barre du bas (Agenda, Contacts)
  void _naviguerVers(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: const Text(
          "Paroisse Saint Léonard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.menu, size: 28),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onSelected: (valeur) {
              switch (valeur) {
                case 1:
                  _naviguerVers(context, const AgendaPage());
                  break;
                case 2:
                  _naviguerVers(context, const ContactsPage());
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.event, color: Colors.black54),
                    SizedBox(width: 12),
                    Text('Agenda'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.phone_outlined, color: Colors.black54),
                    SizedBox(width: 12),
                    Text('Contacts'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      
      // Corps changeant dynamiquement selon l'index sélectionné
      body: _pages[_pageIndex],
      
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: _pageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Accueil"),
          NavigationDestination(icon: Icon(Icons.info), label: "A propos"),
          NavigationDestination(icon: Icon(Icons.groups), label: "Groupes"),
          NavigationDestination(icon: Icon(Icons.church), label: "Messe"),
        ],
      ),
    );
  }
}
