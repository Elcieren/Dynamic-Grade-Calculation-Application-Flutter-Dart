import 'package:dynamic_calculator/constants/app_constants.dart';
import 'package:dynamic_calculator/helper/data_helper.dart';
import 'package:dynamic_calculator/model/ders.dart';
import 'package:dynamic_calculator/widgets/ders_listesi.dart';
import 'package:dynamic_calculator/widgets/harf_dropdown_widget.dart';
import 'package:dynamic_calculator/widgets/kredi_dropdown_widget.dart';
import 'package:dynamic_calculator/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  double secilenHarfDeger=4; // tekrar tekrar çalışmaması için build dışarı çıakrdık
  double secilenKrediDeger=1;
  String girilenDersAdi='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(Sabitler.basliktext,style:Sabitler.baslikStyle,)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Row(
            children: [
               Expanded(
                flex: 2,
              child: _buildForm(),
            ),
            Expanded(
              flex: 1,
              child: OrtalamaGoster(dersSayisi: DataHelper.tumEklenecekDersler.length, ortalama: DataHelper.ortalamaHesapla()),
            ),     
            ],
           ),
            Expanded(
              child: Derslistesi(
                onElemanCikarildi: (index){
                  DataHelper.tumEklenecekDersler.removeAt(index);
                 setState(() {
                   
                 });
                },
              ),
            ),
          ],
        ),
    );
  }
  
 Widget _buildForm() {
  return  Form(
    key: formKey,
    child: Column(
      children: [
        Padding(
          padding: Sabitler.yatayPadding8,
        child: _buildTextFormField(),),
        SizedBox(
          height: 5,
          ),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: Sabitler.yatayPadding8,
                child: HarfDropDownWidget(onHarfSecildi:(harf){
                  secilenHarfDeger=harf;
                } ),
                ),
                ),
            Expanded(child: Padding(
              padding: Sabitler.yatayPadding8,
              child: KrediDropDownWidget(onKrediSecildi: (kredi){
                secilenKrediDeger=kredi;
              }),
              ),
              ),
            IconButton(onPressed: _dersEkleOrtalamHesapla, icon:Icon(Icons.arrow_forward_ios),color: Sabitler.anaRenk,iconSize: 30,),
          ],
        ),
      SizedBox(height: 10,)
      ]),
  );
 }
 
  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
          setState(() {
            girilenDersAdi=deger!;
          });
      },
      validator: (s){
        if (s!.length<=0) {
          return 'Ders Adini Giriniz';
        }
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius,borderSide:BorderSide.none ),
            filled: true,
            fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }
  


  
  

  

  void _dersEkleOrtalamHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers=Ders(ad: girilenDersAdi, harfDegeri: secilenHarfDeger, krediDeger: secilenKrediDeger);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {
        print(DataHelper.ortalamaHesapla());
      });
    }
  }
}