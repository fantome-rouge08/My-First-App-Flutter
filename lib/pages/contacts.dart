import 'package:flutter/material.dart';
import 'navigation.dart';
import 'agenda.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  // Fonction utilitaire pour changer de page proprement
  void _naviguerVers(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF1A66FF);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 1,

        title: const Text(
          'Contactez-nous',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        // Les 'actions' placent les boutons tout à droite de l'AppBar
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.menu, color: Colors.white, size: 26,fontWeight: FontWeight.bold,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            // Déclenche la navigation selon l'option choisie
            onSelected: (valeur) {
              switch (valeur) {
                case 1:
                  // Remplacez par le nom exact de votre classe d'accueil (ex: HomeScreen())
                  _naviguerVers(context, const NavigationPage());
                  break;
                case 2:
                  // Remplacez par le nom exact de votre classe d'agenda (ex: AgendaScreen())
                  _naviguerVers(context, const AgendaPage());
                  break;
              }
            },

            // Liste des options qui s'affichent dans le menu déroulant
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.home_outlined, color: Colors.black54),
                    SizedBox(width: 12),
                    Text('Accueil'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: Colors.black54),
                    SizedBox(width: 12),
                    Text('Agenda'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                _buildContactTile(
                  icon: Icons.email_outlined,
                  iconColor: primaryBlue,
                  title: 'Adresse Email',
                  value: 'paroissesaintleonard@gmail.com',
                ),

                const SizedBox(height: 14),

                _buildContactTile(
                  icon: Icons.phone_android_outlined,
                  iconColor: primaryBlue,
                  title: 'Téléphone',
                  value: '+243 823 489 701',
                ),
              ],
            ),
          ),

          const Spacer(),

          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              '© Paroisse Saint Leonard | Tous droits réservés',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
