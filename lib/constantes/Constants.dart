import 'package:flutter/material.dart';

const List<String> kWilaya = [
  "أدرار",
  "الشلف",
  "الأغواط",
  "أم البواقي",
  "باتنة",
  "بجاية",
  "بسكرة",
  "بشار",
  "البليدة",
  "البويرة",
  "تمنراست",
  "تبسة",
  "تلمسان",
  "تيارت",
  "تيزي وزو",
  "الجزائر",
  "الجلفة",
  "جيجل",
  "سطيف",
  "سعيدة",
  "سكيكيدة",
  "سيدي بلعباس",
  "عنابة",
  "قالمة",
  "قسنطينة",
  "المدية",
  "مستغانم",
  "المسيلة",
  "معسكر",
  "ورقلة",
  "وهران",
  "البيض",
  "إليزي",
  "برج بوعريريج",
  "بومرداس",
  "الطارف",
  "تندوف",
  "تسمسيلت",
  "الوادي",
  "خنشلة",
  "سوق الأهراس",
  "تيبازة",
  "ميلة",
  "عين الدفلى",
  "النعامة",
  "عين تموشنت",
  "غرداية",
  "غليزان",
  "المغير",
  "المنيعة",
  "أولاد جلال",
  "برج باجي مختار",
  "بني عباس",
  "تيميمون",
  "تقرت",
  "جانت",
  "عين صالح",
  "عين قزّام",
];

const List<String> kWilayaNumerated = [
  "1 - أدرار",
  "2 - الشلف",
  "3 - الأغواط",
  "4 - أم البواقي",
  "5 - باتنة",
  "6 - بجاية",
  "7 - بسكرة",
  "8 - بشار",
  "9 - البليدة",
  "10 - البويرة",
  "11 - تمنراست",
  "12 - تبسة",
  "13 - تلمسان",
  "14 - تيارت",
  "15 - تيزي وزو",
  "16 - الجزائر",
  "17 - الجلفة",
  "18 - جيجل",
  "19 - سطيف",
  "20 - سعيدة",
  "21 - سكيكيدة",
  "22 - سيدي بلعباس",
  "23 - عنابة",
  "24 - قالمة",
  "25 - قسنطينة",
  "26 - المدية",
  "27 - مستغانم",
  "28 - المسيلة",
  "29 - معسكر",
  "30 - ورقلة",
  "31 - وهران",
  "32 - البيض",
  "33 - إليزي",
  "34 - برج بوعريريج",
  "35 - بومرداس",
  "36 - الطارف",
  "37 - تندوف",
  "38 - تسمسيلت",
  "39 - الوادي",
  "40 - خنشلة",
  "41 - سوق الأهراس",
  "42 - تيبازة",
  "43 - ميلة",
  "44 - عين الدفلى",
  "45 - النعامة",
  "46 - عين تموشنت",
  "47 - غرداية",
  "48 - غليزان",
  "49 - المغير",
  "50 - المنيعة",
  "51 - أولاد جلال",
  "52 - برج باجي مختار",
  "53 - بني عباس",
  "54 - تيميمون",
  "55 - تقرت",
  "56 - جانت",
  "57 - عين صالح",
  "58 - عين قزّام",
];

enum Vehicules {
  Herbine,
  DFM,
  DFSK,
  DACIA,
  KANGO,
}
Map wilayat = kWilaya.asMap();

class WilayatImages extends StatefulWidget {
  @override
  _WilayatImagesState createState() => _WilayatImagesState();
}

class _WilayatImagesState extends State<WilayatImages> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 140,
        child: ListView.builder(
            itemCount: kWilaya.length,
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                          //borderRadius: BorderRadius.circular(16)
                        ),
                        margin: EdgeInsets.all(6),
                        width: 85,
                        child: Center(
                            child: Image.asset(
                          'images/logo.png',
                        ))),
                    Text(
                      wilayat[i],
                      style: TextStyle(fontSize: 19),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
