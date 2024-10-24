// about_screen.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String title;

  const AboutScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twehe - Guno mukolwa'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.app_shortcut, size: 50),
          ),
          const SizedBox(height: 16),
          const Text(
            'Kifuliiru App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Version 1.0.0',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Twehe',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Guno mukolwa guliri hano, tukaguyinika iziina lye\'ndeto yiitu Kifuliiru. Tuliri Bafuliiru, tugweti tugakola bweneene hogulu lyo\'kudeta kwo indeto yiitu Kifuliiru ihike hala.',
                  ),
                  Text(
                    'Guno mukolwa guliri hano, tukaguyinika iziina lye\'ndeto yiitu Kifuliiru. Tuliri Bafuliiru, tugweti tugakola bweneene hogulu lyo\'kudeta kwo indeto yiitu Kifuliiru ihike hala. Tuliri Bafuliiru, tukoliyiji biingi, yibyo tukoli yiiji tukwaniini tubikoleese higulu tutabaale indeto yitu itatereeke. Guno mukolwa guliri muguma mu mikolwa miingi kera iyagwajikwa no kukolwa na mwenewitu wa Ayivugwe Kabemba. Uno naye anabe aliri muhinga mu bindu bye\'binabwenge. Kera atabaala ibitali na biniini, anakiri mukola ibindi biingi. Guno mukolwa guliri hano higulu tushubi longa ahandi handu ho twangalengera ukulonga imyazi mingi ku Kifuliiru mu Kifuliiru. Tuliri Bafuliiru, tukoli yiji bingi. Kera twabona ngisi kwo ibiindu bigweti bigazaata. Ku zene ibindu byooshi bigweti bigaba ku Internet. Ukudeta kwo nitu tuzamuule indetu Kifuliiru, tukwaniini ukubika byotuyiji ku Internet, Byo\'bitumiri guno mukolwa guliri hano.Menya biguma mu byo\'tuloziizi hano ha lulyo.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoTile('Contact Us', Icons.email),
          _buildInfoTile('Privacy Policy', Icons.privacy_tip),
          _buildInfoTile('Terms of Service', Icons.description),
          _buildInfoTile('Licenses', Icons.copyright),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
