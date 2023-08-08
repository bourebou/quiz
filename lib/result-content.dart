// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/data/questions.dart';
import 'package:test1/sommaire_question.dart';

class ResultContent extends StatelessWidget {
  final List<String> reponseChoisis;
  final Function onReinitialiser;

  const ResultContent({
    Key? key,
    required this.reponseChoisis,
    required this.onReinitialiser,

  }) : super(key: key);

  List<Map<String, Object>> statistiques() {
    List<Map<String, Object>> liste = [];
    for (int i = 0; i < monQuiz.length; i++) {
      liste.add({
        'numeroQuestion': i + 1,
        'texteQuestion': monQuiz[i].texte,
        'bonneReponses': monQuiz[i].reponses[0],
        'reponsechoisie': reponseChoisis[i],
      });
    }
    return liste;
  }

  @override
  Widget build(context) {
    final stats = statistiques();
    final nombreTotal = monQuiz.length;
    final reponsesVraies = stats
        .where((chaqueElement) =>
            chaqueElement['bonneReponses'] == chaqueElement['reponsechoisie'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16 * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'vous avez trouve $reponsesVraies questions sur $nombreTotal',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: SingleChildScrollView(
                //pour rendre coulissable la partie qui n est pas visible
                child: Column(
                  children: [
                    ...statistiques().map(
                      (chaqueMap) => SommaireQuestion(
                        numeroQuestion: chaqueMap['numeroQuestion'] as int,
                        texteQuestion: chaqueMap['texteQuestion'] as String,
                        bonneReponse: chaqueMap['bonneReponses'] as String,
                        reponsesChoisies: chaqueMap['reponsechoisie'] as String,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16 * 3),
            //deuxieme ligne

            TextButton(
                onPressed: () {
                  onReinitialiser();
                },
                child: const Text('REESSAYER'))
            // children: [
            //   Text( 'vous avez 5reponses' ),
            //    Gap(16),
            //    Text('reponses'),

            // ],
          ],
        ),
      ),
    );
  }
}
