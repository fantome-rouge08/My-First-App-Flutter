import 'package:appli1/pages/agenda.dart';
import 'package:flutter/material.dart'; 

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Colors.blueAccent;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      // L'AppBar avec la flèche de retour et le titre de la paroisse
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 30, 
        foregroundColor: Colors.white,
        title: const Text(
          'Paroisse Saint-Léonard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          tooltip: "Retour",
          onPressed: () {
            Navigator.of(context).pop(); // Ferme la page contact et retourne à l'accueil
          },
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 28, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onSelected: (valeur) {
              if (valeur == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AgendaPage()),
                );
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
            ],
          ),
        ],
      ),
      
      body: Column(
        children: [
          // Le grand conteneur bleu avec le titre de la page
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20, bottom: 25, left: 24, right: 24),
            color: primaryBlue,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contactez-nous',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 26, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Restez connecté avec votre communauté paroissiale',
                  style: TextStyle(
                    color: Colors.white70, 
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Liste des coordonnées
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
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

          // Footer
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