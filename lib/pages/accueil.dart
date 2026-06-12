import 'package:appli1/pages/contacts.dart';
import 'package:flutter/material.dart';
import 'a-propos.dart';
import 'groupe.dart';
import 'messes.dart';
import 'agenda.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  // Liste des pages à afficher
  final List<Widget> _pages = [
    const AccueilContent(), // Le contenu de ton ancienne page d'accueil
    const AProposPage(),
    const GroupePage(),
    const MessePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: const Text(
          'Paroisse Saint-Léonard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,

        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 28,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onSelected: (valeur) {
              switch (valeur) {
                case 1:
                  // Navigation vers la page d'agenda si présente
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AgendaPage()),
                  );
                  break;
                case 2:
                  // C'est ici qu'on appelle la page de contact convertie en StatefulWidget !
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactsPage(),
                    ),
                  );
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: Colors.black54),
                    SizedBox(width: 12),
                    Text('Agenda'),
                  ],
                ),
              ),
              // Ajout de l'option de Contact
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.black54),
                    SizedBox(width: 12),
                    Text('Contactez-nous'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

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
          NavigationDestination(icon: Icon(Icons.info), label: "À propos"),
          NavigationDestination(icon: Icon(Icons.groups), label: "Groupes"),
          NavigationDestination(icon: Icon(Icons.church), label: "Messe"),
        ],
      ),
    );
  }
}

// --- CONTENU DE LA PAGE D'ACCUEIL ---
class AccueilContent extends StatefulWidget {
  const AccueilContent({super.key});

  @override
  State<AccueilContent> createState() => _AccueilContentState();
}

class _AccueilContentState extends State<AccueilContent> {
  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Colors.blueAccent;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section Supérieure (En-tête bleu + Carte superposée)
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFF9E77ED),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.church,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Paroisse Saint-Léonard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Mbudi - Mont-Ngafula',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const Text(
                          'Kinshasa, RDC',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(
                          icon: Icons.location_on_outlined,
                          iconColor: primaryBlue,
                          title: 'Adresse',
                          subtitle:
                              'Avenue du Fleuve n°1, Quartier CPA-Mushie, Mbudi',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100), // Espace pour compenser la carte
            // Section Accès Rapide
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Accès rapide',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  //Disposition et affichage de la grille 2x2
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                    

                    //Liste des menus d'acces rapides
                    children: [

                      //Acces rapides aux horaires des messes
                      _buildMenuCard(
                        icon: Icons.access_time_filled,
                        iconColor: Colors.blueAccent,
                        title: 'Horaires',
                        subtitle: "Voir l'horaire",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MessePage(),
                            ),
                          );
                        },
                      ),

                      //Acces rapides a l'agenda
                      _buildMenuCard(
                        icon: Icons.calendar_month,
                        iconColor: Colors.green,
                        title: 'Agenda 2026',
                        subtitle: "Voir l'agenda",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AgendaPage(),
                            ),
                          );
                        },
                      ),
                      
                      //Acces rapides au groupes
                      _buildMenuCard(
                        icon: Icons.people_alt_outlined,
                        iconColor: Colors.purple,
                        title: 'Groupes',
                        subtitle: "Voir les groupes",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GroupePage(),
                            ),
                          );
                        },
                      ),
                      
                      //Acces rapides au rendez-vous
                      _buildMenuCard(
                        icon: Icons.menu_book_rounded,
                        iconColor: Colors.orange,
                        title: 'Rendez-vous',
                        subtitle: "Réservez",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MessePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor, size: 36),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
