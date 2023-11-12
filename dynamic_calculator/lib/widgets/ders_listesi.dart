import 'package:dynamic_calculator/constants/app_constants.dart';
import 'package:dynamic_calculator/helper/data_helper.dart';
import 'package:dynamic_calculator/model/ders.dart';
import 'package:flutter/material.dart';

class Derslistesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const Derslistesi({required this.onElemanCikarildi ,super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler=DataHelper.tumEklenecekDersler;
    return tumDersler.length > 0 ? ListView.builder(itemCount:tumDersler.length,itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed:(a){
           onElemanCikarildi(index);
           
        } ,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(tumDersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: Sabitler.anaRenk,
                child: Text((tumDersler[index].harfDegeri*tumDersler[index].krediDeger).toStringAsFixed(0)),
              ),
              subtitle: Text('${tumDersler[index].krediDeger} Kredi , Not Degeri ${tumDersler[index].harfDegeri}'),
              ),
              
          ),
        ),
      );
    },):Container(child: Center(child: Text('Lütfen Ders Ekleyin',style: Sabitler.baslikStyle,)),);
  }
}