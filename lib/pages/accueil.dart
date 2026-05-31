import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Couleur bleue principale de l'application
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
                // Fond Bleu
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
                        // Icône de la croix blanche sur fond violet clair
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFF9E77ED),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.church, color: Colors.white, size: 32),
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
                        const SizedBox(height: 40), // Espace pour la superposition
                      ],
                    ),
                  ),
                ),
                
                // Carte d'informations (Messes et Adresse)
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
                        // Prochaines messes
                        _buildInfoRow(
                          icon: Icons.calendar_today_outlined,
                          iconColor: primaryBlue,
                          title: 'Prochaines messes',
                          subtitle: 'Dimanche : Lingala 6h30, Bilingue 9h00, Français 11h00',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Divider(height: 1, color: Color(0xFFEEEEEE)),
                        ),
                        // Adresse
                        _buildInfoRow(
                          icon: Icons.location_on_outlined,
                          iconColor: primaryBlue,
                          title: 'Adresse',
                          subtitle: 'Avenue du Fleuve n°1, Quartier CPA-Mushie, Mbudi',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Espace pour compenser la carte en Positioned
            const SizedBox(height: 170),

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
                  
                  // Grille 2x2 des boutons d'accès rapide
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                    children: [
                      _buildMenuCard(
                        icon: Icons.access_time_filled,
                        iconColor: Colors.blue,
                        title: 'Horaires',
                        subtitle: 'des messes',
                      ),
                      _buildMenuCard(
                        icon: Icons.calendar_month,
                        iconColor: Colors.green,
                        title: 'Agenda',
                        subtitle: 'liturgique 2026',
                      ),
                      _buildMenuCard(
                        icon: Icons.people_alt_outlined,
                        iconColor: Colors.purple,
                        title: 'Groupes',
                        subtitle: 'et communautés',
                      ),
                      _buildMenuCard(
                        icon: Icons.menu_book_rounded,
                        iconColor: Colors.orange,
                        title: 'Rendez-vous',
                        subtitle: 'Réservez',
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

  // Widget d'aide pour les lignes d'information (Messes & Adresse)
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.black54, fontSize: 13, height: 1.3),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget d'aide pour les cartes du menu "Accès rapide"
  Widget _buildMenuCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAEAEA)), // Bordure fine claire
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor, size: 36),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
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