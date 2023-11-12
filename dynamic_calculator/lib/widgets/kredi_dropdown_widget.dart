import 'package:dynamic_calculator/constants/app_constants.dart';
import 'package:dynamic_calculator/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropDownWidget({required this.onKrediSecildi,super.key});

  @override
  State<KrediDropDownWidget> createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  double secilenKrediDeger=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenKrediDeger,
        onChanged: (deger) {
           setState(() {
             secilenKrediDeger=deger!;
             widget.onKrediSecildi(deger);
           });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
  
        ),
    );
  }
}