import 'package:flutter/material.dart';

// Modèle de données simple pour représenter un groupe
class GroupeModel {
  final String nom;
  final String imagePath;
  final List<String> paragraphesBio;
  final Map<String, List<String>>?
  sousSections; // Pour les sections spécifiques comme Kizito-Anuarite

  const GroupeModel({
    required this.nom,
    required this.imagePath,
    required this.paragraphesBio,
    this.sousSections,
  });
}

class DetailGroupe extends StatelessWidget {
  final GroupeModel groupe;

  const DetailGroupe({super.key, required this.groupe});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF1A66FF);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 1,
        // Bouton de retour vers l'écran précédent (la liste des Groupes)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          tooltip: "Retour aux groupes",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          groupe.nom,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Zone d'affichage de la photo du groupe
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(groupe.imagePath),
                ),
              ),
            ),

            // 2. Contenu textuel et biographie
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom du groupe
                  Text(
                    groupe.nom,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Mouvement & Association Paroissiale",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Divider(color: Color(0xFFEAEAEA)),
                  ),

                  // Paragraphes de description principaux
                  ...groupe.paragraphesBio.map(
                    (texte) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        texte,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),

                  // Sous-sections dynamiques (ex: Mission et Vision, Kizito, Anuarite)
                  if (groupe.sousSections != null)
                    ...groupe.sousSections!.entries.map(
                      (section) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 14),
                          Text(
                            section.key,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...section.value.map(
                            (paragraphe) => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                paragraphe,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 16),

                  // 3. Bouton d'action pour l'inscription
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primaryBlue.withOpacity(0.3)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "Voulez-vous vous inscrire ?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Mettez ici votre logique vers votre formulaire d'inscription Flutter
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(
                            Icons.assignment_turned_in_outlined,
                            size: 18,
                          ),
                          label: const Text(
                            "Cliquez ici pour rejoindre",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Footer de Copyright issu du code HTML
            const Center(
              child: Text(
                '© Paroisse Saint Leonard | Tous droits réservés',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
