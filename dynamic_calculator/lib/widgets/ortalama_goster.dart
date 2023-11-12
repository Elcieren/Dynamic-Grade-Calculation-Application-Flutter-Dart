import 'package:dynamic_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster({required this.dersSayisi,required this.ortalama,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(dersSayisi>0 ? '$dersSayisi Ders Girildi' : 'Ders seciniz',style: Sabitler.dersSayisiStyle,),
        Text(ortalama >=0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',style: Sabitler.ortalamaStyle,),
        Text('ortalama',style: Sabitler.ortalamGosterBodyStyle,),

      ],
    );
  }
}