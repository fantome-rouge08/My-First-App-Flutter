import 'package:flutter/material.dart';

class GroupeModel {
  final String nom;
  final String imagePath;
  final List<String> paragraphesBio;
  final Map<String, List<String>>? sousSections;

  const GroupeModel({
    required this.nom,
    required this.imagePath,
    required this.paragraphesBio,
    this.sousSections,
  });
}

class DetailsGroupe extends StatefulWidget {
  final GroupeModel groupe;

  const DetailsGroupe({super.key, required this.groupe});

  @override
  State<DetailsGroupe> createState() => _DetailsGroupeState();
}

class _DetailsGroupeState extends State<DetailsGroupe> {
  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Colors.blueAccent; // Aligné avec HomePage

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 1,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          tooltip: "Retour aux groupes",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.groupe.nom,
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
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(widget.groupe.imagePath),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.groupe.nom,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Mouvement & Association Paroissiale",
                    style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Divider(color: Color(0xFFEAEAEA)),
                  ),
                  ...widget.groupe.paragraphesBio.map(
                    (texte) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        texte,
                        style: const TextStyle(fontSize: 14, color: Colors.black, height: 1.5),
                      ),
                    ),
                  ),
                  if (widget.groupe.sousSections != null)
                    ...widget.groupe.sousSections!.entries.map(
                      (section) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 14),
                          Text(
                            section.key,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                          const SizedBox(height: 8),
                          ...section.value.map(
                            (paragraphe) => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                paragraphe,
                                style: const TextStyle(fontSize: 14, color: Colors.black, height: 1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
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
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 45),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          icon: const Icon(Icons.assignment_turned_in_outlined, size: 18),
                          label: const Text("Cliquez ici pour rejoindre", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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