import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/appbar.dart';
import 'package:ii_cpi_project/components/post.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController= ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller:scrollController,
         slivers: [
           HomeAppBar(scrollController: scrollController,),
           SliverToBoxAdapter(
             child: Container(
               height: 140,
               child: ListView.builder(
                   itemCount: kWilaya.length,
                   reverse: true,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (BuildContext context,int i){
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
                       child: Center(child: Image.asset('images/logo.png',))),
                       Text(wilayat[i],
                         style: TextStyle(
                           fontSize: 19
                         )
                         ,textDirection: TextDirection.rtl,),
                     ],
                   ),
                 ) ;
               }),
             ),
           ),
           Post(
             postID: 20,
             postingDate: '22/12/2020',
             postType: 0,
             userId: 244,
             vehicule: Vehicules.DACIA,
             trajet: '1958',
             date: '22/10/2020',
             phoneNumber: 0540047893,
             description:
             'jfjfjjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
           ),
           Post(
             postID: 20,
             postingDate: '22/12/2020',
             postType: 0,
             userId: 244,
             vehicule: Vehicules.DACIA,
             trajet: '1958',
             date: '22/10/2020',
             phoneNumber: 0540047893,
             description:
             'jfjfjjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
           ),
           Post(
             postID: 20,
             postingDate: '22/12/2020',
             postType: 0,
             userId: 244,
             vehicule: Vehicules.DACIA,
             trajet: '1958',
             date: '22/10/2020',
             phoneNumber: 0540047893,
             description:
             'jfjfjjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
           ),
           Post(
             postID: 20,
             postingDate: '22/12/2020',
             postType: 0,
             userId: 244,
             vehicule: Vehicules.DACIA,
             trajet: '1958',
             date: '22/10/2020',
             phoneNumber: 0540047893,
             description:
             'jfjfjjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
           ),
           Post(
             postID: 20,
             postingDate: '22/12/2020',
             postType: 0,
             userId: 244,
             vehicule: Vehicules.DACIA,
             trajet: '1958',
             date: '22/10/2020',
             phoneNumber: 0540047893,
             description:
             'jfjfjjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
           ),
           Post(
             postID: 20,
             postingDate: '22/12/2020',
             postType: 0,
             userId: 244,
             vehicule: Vehicules.DACIA,
             trajet: '1958',
             date: '22/10/2020',
             phoneNumber: 0540047893,
             description:
             'jfjfjjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
           ),


         ],
      ),
    );
  }
}


