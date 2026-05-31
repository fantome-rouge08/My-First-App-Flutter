import 'package:flutter/material.dart';

class GroupesPage extends StatelessWidget {
  const GroupesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Couleur violette de l'en-tête
    const Color blue = Colors.blueAccent;

    // Liste des données pour les groupes et communautés
    final List<Map<String, dynamic>> groupesData = [
      {
        'nom': 'Communauté Famille Chrétienne',
        'description': 'Sanctification des couples et des familles',
        'icon': Icons.favorite_border,
        'iconColor': Colors.red,
        'bgColor': const Color(0xFFFFEBEE),
      },
      {
        'nom': 'Chorale Chœur des Anges',
        'description': 'Animation liturgique et chants sacrés',
        'icon': Icons.music_note_outlined,
        'iconColor': Colors.blue,
        'bgColor': const Color(0xFFE3F2FD),
      },
      {
        'nom': 'Bilenge Ya Mwinda',
        'description': 'Formation intégrale de la jeunesse',
        'icon': Icons.people_outline,
        'iconColor': Colors.green,
        'bgColor': const Color(0xFFE8F5E9),
      },
      {
        'nom': 'Groupe Kizito Anuarite',
        'description': 'Groupe de jeunes catholiques',
        'icon': Icons.add_box_outlined, // Icône de croix stylisée
        'iconColor': Colors.purple,
        'bgColor': const Color(0xFFF3E5F5),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Fond gris très clair
      body: Column(
        children: [
          // En-tête violet personnalisé
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 30, bottom: 30, left: 24, right: 24),
            color: blue, // Couleur violette de l'en-tête
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Groupes et communautés',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Rejoignez notre communauté',
                  style: TextStyle(
                    color: Colors.white, // Blanc légèrement transparent
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Liste défilante des groupes
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: groupesData.length,
              itemBuilder: (context, index) {
                final groupe = groupesData[index];
                return _buildGroupeCard(
                  nom: groupe['nom']!,
                  description: groupe['description']!,
                  icon: groupe['icon']!,
                  iconColor: groupe['iconColor']!,
                  iconBgColor: groupe['bgColor']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget pour générer chaque carte de groupe
  Widget _buildGroupeCard({
    required String nom,
    required String description,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom:16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAEAEA)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rond de couleur en arrière-plan de l'icône
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(width: 16),

          // Contenu textuel à droite
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nom du groupe
                Text(
                  nom,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                
                // Description
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Bouton interactif "En savoir plus →"
                InkWell(
                  onTap: () {
                    // Action au clic
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'En savoir plus ',
                        style: TextStyle(
                          color: Color(0xFF9E16FF), // Violet du texte de lien
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Color(0xFF9E16FF),
                        size: 18,
                      ),
                    ],
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