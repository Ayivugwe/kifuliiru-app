import 'package:flutter/material.dart';

class Kifuliiru extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kifuliiru ndeto yitu',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: const  [
           Text('Ibufuliiru'),
           Text('Kifuliiru'),
           Text('Bafuliiru'),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child : SingleChildScrollView(
       scrollDirection:  Axis.vertical,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const  EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height : 200,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage("assets/images/kifuliiru.png"),
                    fit: BoxFit.cover),
              ),
            ),
           const SizedBox(height: 20,),
           const Align(
             alignment: Alignment.centerLeft,
            child: Text(
              'Kifuliiru mdeto yitu',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
             ),     
            ),
           const Text('Tumenye imyazi yoshi ye\' Kifuliiru. Abafuliiru tuli bandu tutuziri Ibufuliiru tumudeta indeto imuhamagalwa Kifuliiru. Indeto yito yotumuhikangatira imuhamagalwa Kifuliiru. Tumenye bingi higulu lya Bafuliiru na byoshi ibibaloziri.'),
           const SizedBox(height: 20,),
            const Align(
             alignment: Alignment.centerLeft,
            child:
            Text(
              'Abamuganula i Kifuliiru',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
            
            const Text('I Kifuliiru iliiri  ndeto nga zindi ndeto zoshi. Kili kinovu kubabutirwa bayo na kubalya abatuziiri Ibufuliiru kili bangaba batali Bafuliiru  na kubalya abatuziiri kuguma na Bafuliiru kandi li hofi lye Bufuliiru. Mubalya abamuganula i Kifuliiru yo na ndeto iliiri hofi bwnene ne Kifuliiru bali bene witu bamuhamagalya Banyindu. Bamuganula indeto imuhamgalwa Kinyindu. Bano bali hofi litu bwnene ne  ndeto yabo iliri nga yo yimwitu naho Kifuliiru, haliko yizi ndeto zibiri zisigini hanini.'),
           
            const SizedBox(height: 20,),
           
            const Align(
             alignment: Alignment.centerLeft,
            child:
             Text('Ndeto izishushini ne Kifuliiru',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                 ),
              ),
            ),
            const Text( 'I Kifuliiru iliiri  ndeto nga zindi ndeto zoshi. Kili kinovu kubabutirwa bayo na kubalya abatuziiri Ibufuliiru kili bangaba batali Bafuliiru na kubalya abatuziiri kuguma na Bafuliiru kandi li hofi lye Bufuliiru. Mubalya abamuganula i Kifuliiru yo na ndeto iliiri hofi bwnene ne Kifuliiru bali bene witu bamuhamagalya Banyindu. Bamuganula indeto imuhamgalwa Kinyindu. Bano bali hofi litu bwnene ne  ndeto yabo iliri nga yo yimwitu naho Kifuliiru, haliko yizi ndeto zibiri zisigini hanini.'),
            const SizedBox(height: 20,),
            
            const Align(
             alignment: Alignment.centerLeft,
            child:
            Text('Tukole mu Kifuliiru',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                ),
              ),
             ),
            const Text('Ukukola kuliri kuhamu bwenene. Ukudeta kwo ahandu hagendere kandi li abandu bagenderere, babanini ukukola. Nitu higulu lye\'mwitu Ibufuliiru, higulu lya\'abandu biitu Abafuliiru na higulu lye\'ndeto yiitu Kifuliiru; tubanini ukukola bwenene no kubika imisi yiitu yooshi. Ibija byooshi twangahikira bitagashaga mu kubwatala naho kandi li mu miganulo ya kwokwokwo, haliko tubanini tukole.'),
            const SizedBox(height: 20,),
          ],
        ),
      ),
      ),
    ),
    );
  }
}
