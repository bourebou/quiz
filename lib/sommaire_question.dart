import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SommaireQuestion extends StatelessWidget {
  final int numeroQuestion;
  final String texteQuestion;
  final String bonneReponse;
  final String reponsesChoisies;
  const SommaireQuestion({
    Key? key,
    required this.numeroQuestion,
    required this.texteQuestion,
    required this.bonneReponse,
    required this.reponsesChoisies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var=couleur=colors.red ;if(reponseChoisie)

    return Row(
      children: [
        Text(
          '$numeroQuestion',
          style: const TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),
        ),
        const Gap(16 * 2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texteQuestion,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              const Gap(16 / 2),
              Text(
                bonneReponse,
                 style: const TextStyle(
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              Text(
                reponsesChoisies,
                style:  TextStyle(
                  color:reponsesChoisies==bonneReponse?Colors.green: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
