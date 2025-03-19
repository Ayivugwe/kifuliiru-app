import 'package:flutter/material.dart';
import 'package:kifuliiru_app/theme.dart';

class Kifuliiru extends StatelessWidget {
  const Kifuliiru({Key? key}) : super(key: key);

  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFEA580C), Color(0xFFEF4444)],
          ).createShader(bounds),
          child: const Text(
            'Kifuliiru ndeto yitu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Text(
            'Ibufuliiru',
            style: theme.textTheme.titleMedium?.copyWith(
              color: KifuliiruTheme.textColor,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Kifuliiru',
            style: theme.textTheme.titleMedium?.copyWith(
              color: KifuliiruTheme.textColor,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/kifuliiru.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Kifuliiru mdeto yitu',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: KifuliiruTheme.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Tumenye imyazi yoshi ye\' Kifuliiru. Abafuliiru tuli bandu tutuziri Ibufuliiru tumudeta indeto imuhamagalwa Kifuliiru. Indeto yito yotumuhikangatira imuhamagalwa Kifuliiru. Tumenye bingi higulu lya Bafuliiru na byoshi ibibaloziri.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Abamuganula i Kifuliiru',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: KifuliiruTheme.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'I Kifuliiru iliiri  ndeto nga zindi ndeto zoshi. Kili kinovu kubabutirwa bayo na kubalya abatuziiri Ibufuliiru kili bangaba batali Bafuliiru  na kubalya abatuziiri kuguma na Bafuliiru kandi li hofi lye Bufuliiru. Mubalya abamuganula i Kifuliiru yo na ndeto iliiri hofi bwnene ne Kifuliiru bali bene witu bamuhamagalya Banyindu. Bamuganula indeto imuhamgalwa Kinyindu. Bano bali hofi litu bwnene ne  ndeto yabo iliri nga yo yimwitu naho Kifuliiru, haliko yizi ndeto zibiri zisigini hanini.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Ndeto izishushini ne Kifuliiru',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: KifuliiruTheme.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'I Kifuliiru iliiri  ndeto nga zindi ndeto zoshi. Kili kinovu kubabutirwa bayo na kubalya abatuziiri Ibufuliiru kili bangaba batali Bafuliiru na kubalya abatuziiri kuguma na Bafuliiru kandi li hofi lye Bufuliiru. Mubalya abamuganula i Kifuliiru yo na ndeto iliiri hofi bwnene ne Kifuliiru bali bene witu bamuhamagalya Banyindu. Bamuganula indeto imuhamgalwa Kinyindu. Bano bali hofi litu bwnene ne  ndeto yabo iliri nga yo yimwitu naho Kifuliiru, haliko yizi ndeto zibiri zisigini hanini.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Tukole mu Kifuliiru',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: KifuliiruTheme.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ukukola kuliri kuhamu bwenene. Ukudeta kwo ahandu hagendere kandi li abandu bagenderere, babanini ukukola. Nitu higulu lye\'mwitu Ibufuliiru, higulu lya\'abandu biitu Abafuliiru na higulu lye\'ndeto yiitu Kifuliiru; tubanini ukukola bwenene no kubika imisi yiitu yooshi. Ibija byooshi twangahikira bitagashaga mu kubwatala naho kandi li mu miganulo ya kwokwokwo, haliko tubanini tukole.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Tukole mu Kifuliiru',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: KifuliiruTheme.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ukukola kuliri kuhamu bwenene. Ukudeta kwo ahandu hagendere kandi li abandu bagenderere, babanini ukukola. Nitu higulu lye\'mwitu Ibufuliiru, higulu lya\'abandu biitu Abafuliiru na higulu lye\'ndeto yiitu Kifuliiru; tubanini ukukola bwenene no kubika imisi yiitu yooshi. Ibija byooshi twangahikira bitagashaga mu kubwatala naho kandi li mu miganulo ya kwokwokwo, haliko tubanini tukole.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Tukole mu Kifuliiru',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: KifuliiruTheme.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ukukola kuliri kuhamu bwenene. Ukudeta kwo ahandu hagendere kandi li abandu bagenderere, babanini ukukola. Nitu higulu lye\'mwitu Ibufuliiru, higulu lya\'abandu biitu Abafuliiru na higulu lye\'ndeto yiitu Kifuliiru; tubanini ukukola bwenene no kubika imisi yiitu yooshi. Ibija byooshi twangahikira bitagashaga mu kubwatala naho kandi li mu miganulo ya kwokwokwo, haliko tubanini tukole.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ukukola kuliri kuhamu bwenene. Ukudeta kwo ahandu hagendere kandi li abandu bagenderere, babanini ukukola. Nitu higulu lye\'mwitu Ibufuliiru, higulu lya\'abandu biitu Abafuliiru na higulu lye\'ndeto yiitu Kifuliiru; tubanini ukukola bwenene no kubika imisi yiitu yooshi. Ibija byooshi twangahikira bitagashaga mu kubwatala naho kandi li mu miganulo ya kwokwokwo, haliko tubanini tukole.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
