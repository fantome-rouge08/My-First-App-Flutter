import 'package:appli1/pages/agenda.dart';
import 'package:appli1/pages/contacts.dart';
import 'package:flutter/material.dart';
import 'package:appli1/pages/accueil.dart';
import 'package:appli1/pages/a-propos.dart';
import 'package:appli1/pages/groupe.dart';
import 'package:appli1/pages/messes.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  final pages = [HomeScreen(), AProposPage(), GroupesPage(), MessePage()];


  //Fonction utilitaire pour changer de page
  void _naviguerVers(BuildContext context , Widget page){
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => page));
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 18,
          backgroundColor: Colors.blueAccent,
          actions: [
           PopupMenuButton<int>(
          // L'icône de menu (trois barres) blanche
          icon: const Icon(Icons.menu, color: Colors.white, size: 28, fontWeight: FontWeight.bold),
          // Style du menu déroulant
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          
          // Déclencheur lors du clic sur une option
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
          // Contenu du menu déroulant
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
          title: Text(
            "Paroisse Saint Leonard",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: pages[pageIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: pageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Accueil"),
            NavigationDestination(icon: Icon(Icons.info), label: "A propos"),
            NavigationDestination(icon: Icon(Icons.groups), label: "Groupes"),
            NavigationDestination(icon: Icon(Icons.church), label: "Messe"),
          ],
        ),
      ),
    );
  }
}
