import 'package:flutter/material.dart';
import 'package:test1/data/questions.dart';
import 'package:test1/quiz_content.dart';

import 'package:test1/welcome_content.dart';
import 'result-content.dart';

void commencer() {}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  void update() {}

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var activeContent = 'welcome-content';
  List<String> reponsesChoisies = [];

  //ici la liste des reponses choisies est vide c est l'initialisation
  void update() {
    setState(() {
      activeContent = 'quiz-content';
    });
  }

  void reset() {
    setState(() {
      reponsesChoisies.clear();
      activeContent = 'welcome-content';
    });
  }

  void repondre(String reponse) {
    //Void repondons(string gout){ reponseschoisies.add(gout);}
    reponsesChoisies.add(reponse); //enregistrement dans le boutonreponses ma reponse dans  reponseschoisies

    if (reponsesChoisies.length == monQuiz.length) {
      //si la longueur de la liste des reponses choisies est egale a celle du quiz
      setState(() {
        activeContent =
            "result-content"; //alors on se dirige vers result content
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? content;
    if (activeContent == "welcome-content") {
      content = WelcomeContent(bouton: update);
    }
    if (activeContent == "quiz-content") {
      content = QuizContent(repondre: repondre);
    }
    if (activeContent == "result-content") {
      content = ResultContent(
        reponseChoisis: reponsesChoisies,
        onReinitialiser: reset,
      ); //reponsechoisis: ensemble des reponses du quiz jusqu a la fin du quiz
    } //reponseschoisies ensemble des reponses en cours de processus

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: content,
      ),
    );
  }
}
// Widget ?activeContent

// @override
// void initState() {
//   activeContent = WelcomeContent(
//     bouton: update,
//   );
//   super.initState();
// }
// void update() {
//     setState(() {
//       activeContent =  QuizContent();
//     });
//   }
// @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.purple,
//         body: activeContent,
//       ),
//     );
//   }
// }
