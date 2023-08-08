import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/bouton_reponse.dart';
import 'package:test1/data/questions.dart';

// ignore: must_be_immutable
class QuizContent extends StatefulWidget {
  final Function repondre;
  const QuizContent({super.key, required this.repondre});
  void update2() {}

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  var index = 0;
  void questionsuivante() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeQuestion = monQuiz[index];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        //
        padding: const EdgeInsets.all(16 * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, //permet d'etendre sur la largeur
          children: [
            Text(
              activeQuestion.texte,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign:
                  TextAlign.center, //textalign permet de centrer notre texte
            ),
            const Gap(16 * 4),
            ...activeQuestion.qcm().map((reponse) {
              //NOM  PRENOM '${e.nom} ${e.prenom}'
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Boutonreponses(
                  texte: reponse,
                  clic: () {
                    widget.repondre(reponse);//Reondre a ete definit dans le statefullwidget mais il est utilise dans le state voila pourquoi on utilise widget.repondre pour creer le pont entre le state et le statefulwidget
                    questionsuivante();
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
