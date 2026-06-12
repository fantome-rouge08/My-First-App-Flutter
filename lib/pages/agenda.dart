import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime(2026, 1, 1);
  DateTime? _selectedDay;


  // Fonction pour mettre la première lettre du mois en majuscule
  String _formaterMoisMajuscule(DateTime date, dynamic locale) {
    String texte = DateFormat.yMMMM(locale).format(date);
    return '${texte[0].toUpperCase()}${texte.substring(1)}';
  }

  String _formaterJourMajuscule(DateTime date, dynamic locale) {
    String texte = DateFormat.E(locale).format(date);
    return '${texte[0].toUpperCase()}${texte.substring(1)}';
  }



  // Dictionnaire des dates et evenements
  final Map<String, Map<String, String>> _evenements2026 = {
    '2026-01-06': {'titre': 'Épiphanie', 'desc': 'Clôture solennelle du Jubilé.'},
    '2026-02-18': {'titre': 'Mercredi des Cendres', 'desc': 'Entrée en Carême et temps de pénitence.'},
    '2026-03-29': {'titre': 'Dimanche des Rameaux', 'desc': 'Début de la Semaine Sainte.'},
    '2026-04-02': {'titre': 'Jeudi Saint', 'desc': 'Dernier repas de notre Seigneur.'},
    '2026-04-03': {'titre': 'Vendredi Saint', 'desc': 'Passion et Crucifixion de notre Jesus.'},
    '2026-04-04': {'titre': 'Samedi Saint', 'desc': 'Mort de notre Seigenur Jesus-Christ.'},
    '2026-04-05': {'titre': 'Pâques', 'desc': 'Résurrection de Jésus-Christ ! Le Christ est vivant !'},
    '2026-05-14': {'titre': 'Ascension', 'desc': 'Montée de Jésus vers son Père.'},
    '2026-05-24': {'titre': 'Pentecôte', 'desc': 'Descente de l\'Esprit Saint sur les apôtres.'},
    '2026-05-31': {'titre': 'Sainte-Trinite', 'desc': 'Fête de la Sainte-Trinité.'},
    '2026-06-07': {'titre': 'Saint-Sacrement', 'desc': 'Fête du Saint-Sacrement du corps et du sang du Christ.'},    '2026-08-15': {'titre': 'Assomption', 'desc': 'Fête de la Vierge Marie, patronne de la communauté.'},
    '2026-11-01': {'titre': 'Toussaint', 'desc': 'Fête de tous les saints connus et inconnus.'},
    '2026-12-24': {'titre': 'Reveillon', 'desc': 'Veille de Noel.'},
    '2026-12-25': {'titre': 'Noël', 'desc': 'Nativité de notre Seigneur Jésus-Christ.'},

  };

  // Formatage de la date en clé 'AAAA-MM-JJ'
  String _obtenirCleDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  // Fonction qui affiche le Pop-up si un événement existe
  void _verifierEvenement(DateTime date) {
    String cleDate = _obtenirCleDate(date);

    if (_evenements2026.containsKey(cleDate)) {
      final evenement = _evenements2026[cleDate]!;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Row(
              children: [
                const Icon(Icons.church, color: Colors.blueAccent),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(evenement['titre']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
            content: Text(evenement['desc']!, style: const TextStyle(fontSize: 16)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fermer', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color blue = Colors.blueAccent;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // En-tête bleu avec conditions ternaires d'accès rapide
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: Navigator.canPop(context) ? 50.0 : 20.0,
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
                    if (Navigator.canPop(context)) ...[
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, size: 28, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                    ],
                    const Expanded(
                      child: Text(
                        'Calendrier Liturgique',
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Navigator.canPop(context)
                    ? Padding(
                        padding: EdgeInsetsGeometry.only(left: 65),
                        child: Text('Agenda Paroissial 2026', style: TextStyle(color: Colors.white70, fontSize: 16)),
                      )
                    : const Text('Agenda Paroissial 2026', style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),

          // Corps du calendrier interactif
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCalendar(
                        locale:'FR_fr' ,
                        firstDay: DateTime(2026, 1, 1),
                        lastDay: DateTime(2026, 12, 31),
                        focusedDay: _focusedDay,
                        calendarFormat: _calendarFormat,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextFormatter: _formaterMoisMajuscule, //Titre des jours en majuscule
                        ),
                        // Style des jours de la semaine (Lun, Mar, Mer...)
                        daysOfWeekStyle: DaysOfWeekStyle(
                          dowTextFormatter: _formaterJourMajuscule,
                          weekendStyle: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                        ),
                        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                          _verifierEvenement(selectedDay);
                        },
                        onFormatChanged: (format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                        
                        // CONFIGURATION STYLE DES JOURS AVEC ÉVÉNEMENTS
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            String cle = _obtenirCleDate(day);
                            
                            // Si le jour possède un événement, on lui donne un style spécial
                            if (_evenements2026.containsKey(cle)) {
                              return Container(
                                margin: const EdgeInsets.all(4.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.15), // Fond léger orangé
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '${day.day}',
                                  style: const TextStyle(
                                    color: Colors.deepOrange, // Texte en Orange foncé / Rouge
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }
                            return null; // Style par défaut de Flutter pour les autres jours
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Légende explicative
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(color: Colors.orange.withOpacity(0.3), shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            "Les jours colorés en orange indiquent une solennité ou un événement paroissial. Appuyez dessus !",
                            style: TextStyle(color: Colors.black54, fontSize: 13, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}