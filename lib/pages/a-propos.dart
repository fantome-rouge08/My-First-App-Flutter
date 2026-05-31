import 'package:flutter/material.dart';

class AProposPage extends StatelessWidget {
  const AProposPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Colors.blueAccent;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // En-tête bleu personnalisé
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 35, bottom: 20, left: 24, right: 24),
            color: primaryBlue,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'À propos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Histoire et organisation de notre paroisse',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Contenu historique et géographique défilant
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // 1. Situation Géographique
                _buildSectionCard(
                  title: '1. Situation géographique',
                  icon: Icons.map_outlined,
                  iconColor: Colors.blue,
                  content: 'La paroisse Saint Léonard est située dans la commune de Mont-Ngafula, localité de Mbudi, Quartier CPA – Mushie, sur l’avenue du fleuve n° 1.\n\n'
                      '• Au nord : séparée de la paroisse Sainte Élisabeth par le pont du cinquantenaire (commune de Ngaliema).\n'
                      '• À l’Est : voisine de la paroisse Saint Tharcisse (Kimbwala).\n'
                      '• À l’ouest : bordée par le fleuve Congo.\n'
                      '• Au Sud : limitée par la concession de l’église Kimbanguiste de Lutendele et la carrière Safricas.',
                ),

                // 2. Origine de la Paroisse
                _buildSectionCard(
                  title: '2. Origine de la Paroisse',
                  icon: Icons.history_edu,
                  iconColor: Colors.orange,
                  content: 'Dès 1980, le quartier Mbudi était sous-peuplé. Quatre familles catholiques (Isidore Miansadi, Bila Kulemwinpese Désiré, Maurice Nzinga et Timothée Seina) ont commencé à se réunir pour prier ensemble chez le papa Seina Timothée, créant la communauté « LISOLO » (devenue CEVB Bondero).\n\n'
                      'En 1989, grâce à l’implication du père Jacques Thomas, le terrain actuel fut acquis. La première messe y a été célébrée pour la fête des Rameaux le 07 avril 1989 par le père Barthélémy Mpiana, dans une église encore en construction.\n\n'
                      'Le nom de Saint Léonard a été choisi comme Saint Patron en hommage aux propositions entourant le père Léonard Van Bal et le père Léonard Kasanda (futur Évêque de Luiza).',
                ),

                // 3. Organisation Interne (Chronologie et Commissions)
                _buildSectionCard(
                  title: '3. Organisation Interne',
                  icon: Icons.account_tree_outlined,
                  iconColor: Colors.purple,
                  content: 'Dès l’ouverture, le premier conseil paroissial fut mis en place avec des commissions clés (Liturgie, Catéchèse, Jeunes). Parmi les personnes ayant favorisé l’apostolat à ses débuts figurait l’actuel Cardinal Fridolin Ambongo Besungu, alors étudiant.\n\n'
                      'En 1994, le père Paul Le Poutre devient le premier curé, structurant le Renouveau Charismatique, les Kizito-Anuarite et les services Caritas.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom:20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAEAEA)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(height: 1, color: Color(0xFFF0F0F0)),
          ),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}