import 'package:dynamic_calculator/constants/app_constants.dart';
import 'package:dynamic_calculator/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({required this.onHarfSecildi,super.key});
  

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDeger=4;
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenHarfDeger,
        onChanged: (deger) {
           setState(() {
             secilenHarfDeger=deger!;
             widget.onHarfSecildi(secilenHarfDeger);
           });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
  
        ),
    );
  }
}