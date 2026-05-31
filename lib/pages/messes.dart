import 'package:flutter/material.dart';

class MessePage extends StatelessWidget {
  const MessePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Colors.blueAccent;

    // Simulation de données pour les cartes
   final List<Map<String, dynamic>> horairesSemaine = [
      {
        'jour': 'Lundi',
        'messes': [
          {'heure': '6h00 - 6h45', 'type': 'Messe matinale','isSpecial': false}
        ],
      },
      {
        'jour': 'Mardi',
        'messes': [
          {'heure': '6h00 - 6h45', 'type': 'Messe matinale','isSpecial': false}
        ],
      },
      {
        'jour': 'Mercredi',
        'messes': [
          {'heure': '6h00 - 6h45', 'type': 'Messe matinale','isSpecial': false}
        ],
      },
      {
        'jour': 'Jeudi',
        'messes': [
          {'heure': '6h00 - 6h45', 'type': 'Messe matinale','isSpecial': false}
        ],
      },
      {
        'jour': 'Vendredi',
        'messes': [
          {'heure': '6h00 - 6h45', 'type': 'Messe matinale','isSpecial': false},
          {
            'heure': '17h30 - 18h30',
            'type': 'Messe des Jeunes',
            'isSpecial': true,
            'note': 'Chaque dernier vendredi du mois',
          },
        ],
      },
      {
        'jour': 'Samedi',
        'messes': [
          {'heure': '6h00 - 6h45', 'type': 'Messe matinale','isSpecial': false},
          {
            'heure': '17h30 - 18h30',
            'type': 'Messe du soir',
            'isSpecial': true,
          },
        ],
      },
      {
        'jour': 'Dimanche',
        'messes': [
          {'heure': '6h30 - 8h30', 'type': 'Messe en Lingala','isSpecial': false},
          {'heure': '9h00 - 11h00', 'type': 'Messe Bilingue (Français - Lingala)','isSpecial': false},
          {'heure': '11h30 - 13h00', 'type': 'Messe en Français','isSpecial': false},
        ],
      },
    ];

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
                  'Horaires des messes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Paroisse Saint-Léonard',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Liste défilante des 7 jours de la semaine
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: horairesSemaine.length,
              itemBuilder: (context, index) {
                final item = horairesSemaine[index];
                return _buildJourCard(
                  jour: item['jour'],
                  messes: item['messes'],
                  iconColor: primaryBlue,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget de construction d'une carte journalière
  Widget _buildJourCard({
    required String jour,
    required List<dynamic> messes,
    required Color iconColor,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre du Jour
          Text(
            jour,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Liste des messes internes à ce jour
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: messes.length,
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(height: 1, color: Color(0xFFF5F5F5)),
            ),
            itemBuilder: (context, index) {
              final messe = messes[index];
              final bool isSpecial = messe['isSpecial'] ?? false;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time, 
                    color: isSpecial ? Colors.redAccent : iconColor, 
                    size: 22
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              messe['heure'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            if (isSpecial) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF3E0),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'Exception',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          messe['type'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        if (messe['note'] != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            messe['note'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}