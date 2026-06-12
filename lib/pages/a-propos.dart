import 'package:flutter/material.dart';

class AProposPage extends StatefulWidget {
  const AProposPage({super.key});

  @override
  State<AProposPage> createState() => _AProposPageState();
}

class _AProposPageState extends State<AProposPage> {
  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Colors.blueAccent; 

    return Column(
      children: [
        // Le container bleu mentionnant "À propos" est de retour ici
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 25, bottom: 20, left: 24, right: 24),
          color: primaryBlue,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'À propos',
                style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                'Histoire et organisation de notre paroisse',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ),
        
        // Les autres cartes d'informations
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
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
              _buildSectionCard(
                title: '2. Origine de la Paroisse',
                icon: Icons.history_edu,
                iconColor: Colors.orange,
                content: """Dès 1980, le quartier Mbudi était sous peuplé avec des habitations disparates et éloignées les unes des autres. Quatre familles catholiques qui y habitaient avaient pris l’habitude de se réunir pour prier ensemble chez la famille de papa Seina Timothée. Il s’agit des familles : Isidore Miansadi, Bila Kulemwinpese Désiré, Maurice Nzinga et celle de papa Sema Timothée dans la communauté dénommée << LISOLO>> qui prendra plus tard le nom de CEB LISOLO, actuellement CEVB BONDERO.\n\nEn 1982, ces quatre familles auxquelles vont se joindre celle de maman Elisabeth Ngwala, papa Alexandre Vilukidi, papa Vincent Biangani, papa Philippe Adjoyo, papa Alphonse Bezinga de la cellule CPA vont commencer à aller assister à la messe dominicale d’abord au Noviciat CICM et par la suite chez les Frères Prémontrés, lorsque la chapelle de CICM s’est avérée petite pour accueillir tous les chrétiens qui étaient toujours en nombre croissant, en plus, ces deux maisons ecclésiastiques étaient des maisons de formation n’ont pas cette vocation d’accueillir un grand nombre des chrétiens.""",
               
              ),
              _buildSectionCard(
                title: '3. Organisation Interne',
                icon: Icons.account_tree_outlined, 
                iconColor: Colors.purple, 
                content: """Dès l’ouverture, le premier conseil paroissial fut mis en place avec des commissions clés. Cette organisation visait à impliquer les fidèles dans la vie de la communauté et à assurer une gestion équilibrée de la paroisse. Le curé, garant de la vie spirituelle, préside le conseil et veille à son bon fonctionnement.\n\nLe conseil paroissial est composé des membres suivants :
                - Le Curé, Président ;
                - Le Vicaire, Coordonnateur;
                - Le Chef de poste, Secrétaire;
                - Les Coordinateurs des mouvements et associations;
                - Les Coordinateurs des zones pastorales et communautés ecclésiales de base (CEVB).""",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 10),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(height: 1, color: Color(0xFFF0F0F0)),
          ),
          Text(content, style: const TextStyle(fontSize: 14, color: Colors.black54, height: 1.4)),
        ],
      ),
    );
  }
}