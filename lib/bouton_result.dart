
import 'package:flutter/material.dart';

class Boutonreponses extends StatelessWidget {
  final String texte;
  final Function clic;
  const Boutonreponses({
    Key? key,
    required this.texte,
    required this.clic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        clic();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1D0561),
        padding: const EdgeInsets.symmetric(
          vertical: 16*2,
          horizontal: 16*4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),),
      ),
      child: const Text('REESSAYER'),
    );
  }
}
