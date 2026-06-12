import 'package:flutter/material.dart';
import 'detail-groupe.dart';

class GroupePage extends StatefulWidget {
  const GroupePage({super.key});

  @override
  State<GroupePage> createState() => _GroupesPageState();
}

class _GroupesPageState extends State<GroupePage> {
  // 1. Dictionnaire complet contenant l'intégralité des bios et des sous-sections historiques
  final Map<String, GroupeModel> tousLesGroupes = {
    'bym': const GroupeModel(
      nom: "Bilenge Ya Mwinda",
      imagePath: "assets/images/BYM.jpeg",
      paragraphesBio: [
        "L'expression Bilenge ya Mwinda historique saint Leonard fait référence à la pastorale des Bilenge ya Mwinda, un mouvement d'initiation religieuse pour les jeunes en République Démocratique du Congo (RDC), fondée dans les années 70 et reconnue officiellement en 1974 . Ce mouvement est particulier car il s'inscrit dans une démarche d'inculturation, c'est-à-dire qu'il puise dans les valeurs des cultures négro-africaines pour offrir une formation intégrale, humaine et chrétienne à la jeunesse.",
      ],
    ),
    'cfc': const GroupeModel(
      nom: "Communauté Famille Chrétienne",
      imagePath: "assets/images/cfc.jpg",
      paragraphesBio: [
        "La Communauté Famille Chrétienne à Kinshasa est un mouvement catholique laïc fondé en 1984 par le couple Léon et Marie Valentine Botolo. Elle est reconnue comme une association privée de fidèles sur le plan canonique et comme une organisation à but non lucratif sur le plan civil",
      ],
      sousSections: {
        "Mission et vision": [
          "La CFC œuvre principalement à la sanctification des couples et des familles, en mettant l’accent sur la défense et la promotion des valeurs familiales chrétiennes. Elle s’engage activement pour la protection de la famille, considérée comme une priorité absolue dans le contexte sociétal actuel.",
        ],
      },
    ),
    'choeur': const GroupeModel(
      nom: "Chorale Chœur des Anges",
      imagePath: "assets/images/Chorales-anges.jpg",
      paragraphesBio: [
        "La Chorale Chœur des Anges est affiliée à la Paroisse Saint Léonard de Mbudi, située dans la commune de Mont Ngafula à Kinshasa. Elle participe activement à l’animation des messes et autres événements religieux de la paroisse. La chorale dispose d’une chaîne YouTube officielle où elle partage régulièrement des vidéos de ses prestations, telles que l’interprétation de « Angele Dei » en novembre 2023.",
      ],
    ),
    'kizito': const GroupeModel(
      nom: "Groupe Kizito Anuarite",
      imagePath: "assets/images/Kizito-Anuarite.jpg",
      paragraphesBio: [],
      sousSections: {
        "1. LE GROUPE ANUARITE": [
          "Dans les années 1972—1973, les mouvements de jeunesse furent abolis au Zaïre. Les cours de religion avaient été supprimés dans toutes les écoles...",
          "En 1977, elle a demandé à Soeur Tina Anthonissen, Sœur Missionnaire de Notre Dame d’Afrique, de lui venir en aide afin de structurer et d’étoffer ces rencontres...",
        ],
        "2. LE GROUPE KIZITO": [
          "Déjà en 1976, le groupe Kizito pour les garçons est né sous l’impulsion du Père André Thijs, Missionnaire d’Afrique. Ce dernier avait déjà l’habitude de nommer les acolytes de la Paroisse Mateo de Kifungo (Kalemie), les « Kizito ».",
          "Au début ils sont 25 à 30, très fidèles et tout donnés à leur service du Seigneur Jésus dans l’eucharistie chaque dimanche et aussi en semaine...",
        ],
      },
    ),
  };

  // 2. Liste de configuration de l'affichage visuel de la liste
  final List<Map<String, dynamic>> groupesData = [
    {
      'id': 'cfc',
      'nom': 'Communauté Famille Chrétienne',
      'description': 'Sanctification des couples et des familles',
      'icon': Icons.favorite_border,
      'iconColor': Colors.red,
      'bgColor': const Color(0xFFFFEBEE),
    },
    {
      'id': 'choeur',
      'nom': 'Chorale Chœur des Anges',
      'description': 'Animation liturgique et chants sacrés',
      'icon': Icons.music_note_outlined,
      'iconColor': Colors.blue,
      'bgColor': const Color(0xFFE3F2FD),
    },
    {
      'id': 'bym',
      'nom': 'Bilenge Ya Mwinda',
      'description': 'Formation intégrale de la jeunesse',
      'icon': Icons.people_outline,
      'iconColor': Colors.green,
      'bgColor': const Color(0xFFE8F5E9),
    },
    {
      'id': 'kizito',
      'nom': 'Groupe Kizito Anuarite',
      'description': 'Groupe de jeunes catholiques',
      'icon': Icons.add_box_outlined,
      'iconColor': Colors.purple,
      'bgColor': const Color(0xFFF3E5F5),
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color blue = Colors.blueAccent;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // En-tête bleu
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: Navigator.canPop(context) ? 50:25,
              bottom: 20,
              left: 24,
              right: 24,
            ),
            color: blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Affiche le bouton retour UNIQUEMENT si on vient de l'accès rapide
                    if (Navigator.canPop(context)) ...[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    const Expanded(
                      child: Text(
                        'Groupes et communautés',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                // Sous-titre en dessous
                const SizedBox(height: 5),
                Navigator.canPop(context) ?
                const Center(
                  child: Text(
                    "Rejoignez notre communauté",
                    style: TextStyle(color: Colors.white70 , fontSize: 16 ),
                  ),
                )
                :
                const Text(
                  "Rejoignez notre communauté",
                  style: TextStyle(color: Colors.white70,fontSize: 16),
                )
              ],
            ),
          ),

          // Liste des groupes
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: groupesData.length,
              itemBuilder: (context, index) {
                final groupe = groupesData[index];
                return _buildGroupeCard(
                  id: groupe['id']!,
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

  //Card Builder interactif avec redirection dynamique vers la page de détails
  Widget _buildGroupeCard({
    required String id,
    required String nom,
    required String description,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nom,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),

                // Bouton "En savoir plus"
                InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    final groupeChoisi = tousLesGroupes[id];
                    if (groupeChoisi != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsGroupe(groupe: groupeChoisi),
                        ),
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 2.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'En savoir plus ',
                          style: TextStyle(
                            color: Color(0xFF9E16FF),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
