/* import 'package:flutter/material.dart';
import 'package:kifuliiru_app/kifuliiru.dart';
import 'package:kifuliiru_app/news_screen.dart';
import 'package:kifuliiru_app/settings.dart';
import 'package:kifuliiru_app/twehe.dart';
import 'ibiyandike_mu_kifuliiru.dart';
import 'radio_ibufuliiru.dart';
import 'gambo_lihyahya.dart';
import 'imyazi.dart';
import 'site_web_yitu.dart';
import 'kifuliiru_ne_kifuliiru.dart';
import 'kifuliiru_ne_kifaransa.dart';
import 'kifuliiru_ne_kingereza.dart';
import 'kifuliiru_ne_kiswahili.dart';

class Home extends StatelessWidget {
  final appTitle = 'KIFULIIRU NDETO YITU';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageWidgetState createState() => _MyHomePageWidgetState();
  final String title = '';
}

class _MyHomePageWidgetState extends State<MyHomePage> {
  //_MyHomePageWidgetState({Key key, this.title}) : super(key: key);
  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            color: Colors.red,
            tooltip: 'Imyazi',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Longa imyazi mu Kifuliiru')));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Paramètres',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));

              //Navigator.MaterialPageRoute(builder: (context) => Settings());
            },
          ),
        ],
        elevation: 0,
        title: const Text(
          'KIFULIIRU NDETO YITU',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        //backgroundColor: HexColor('#f2d7d5'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.red[100],
      body: Center(
        child: ListView(children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.red[100],
            ),
            width: MediaQuery.of(context).size.width,
            child: const Column(children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Muyegerere tumenye bingi ku Kifuliiru mu Kifuliiru',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                //textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width - 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white54,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Menya Bingi ku Kifuliiru',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Kifuliiru()),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 170,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white54,
                                ),
                                child: const Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Positioned(
                                        top: 20,
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          backgroundImage: AssetImage(
                                            'assets/images/kifuliiru.png',
                                          ),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Positioned(
                                        bottom: 20,
                                        child: Text(
                                          'Kifuliiru',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Kifuliiru()),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 170,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white54,
                                ),
                                child: const Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Positioned(
                                        top: 20,
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/rdc.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Positioned(
                                          bottom: 20,
                                          child: Text(
                                            'Kifuliiru mu Congo',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                    ]),
                              ),
                            ),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const IbiyandikeMuKifuliiru()),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 170,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white54,
                                ),
                                child: const Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Positioned(
                                        top: 20,
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/kifuliiru.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Positioned(
                                        bottom: 20,
                                        child: Text(
                                          'Ibiyandike',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Imyazi()),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 170,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white54,
                                ),
                                child: const Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Positioned(
                                        top: 20,
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/rdc.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Positioned(
                                        bottom: 20,
                                        child: Text(
                                          'Imyazi',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Magambo ge\'Kifuliiru',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const KifuliiruNeKifuliiru()),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white54,
                            ),
                            child: const Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Positioned(
                                    top: 20,
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      backgroundImage: AssetImage(
                                        'assets/images/rdc.png',
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'Kifuliiru-Kifuliiru',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const KifuliiruNeKiswahili()),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white54,
                            ),
                            child: const Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Positioned(
                                    top: 20,
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/tanzania.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                      bottom: 20,
                                      child: Text(
                                        'Kifuliiru-Kiswahili',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ]),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const KifuliiruNeKifaransa()),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white54,
                            ),
                            child: const Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Positioned(
                                    top: 20,
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/france.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'Kifuliiru - Kifaransa',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const KifuliiruNeKingereza()),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white54,
                            ),
                            child: const Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Positioned(
                                    top: 20,
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/USA.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'Kifuliiru - Kingereza',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.all(5),

          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage("assets/images/rdc.png"),
                    fit: BoxFit.cover),
              ),
              child: Text(''),
            ),
            const Divider(),
            ListTile(
              title: const Text('Yongera igambo lihyahya'),
              leading: const Icon(
                Icons.add,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GamboLihyahya()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              tileColor: Colors.white,
              title: const Text('Kifuliiru-Kifuliiru'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KifuliiruNeKifuliiru()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              title: const Text('Kifuliiru-Kiswahili'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KifuliiruNeKiswahili()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              tileColor: Colors.white,
              /*  trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Kifuliiru-Kifaransa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KifuliiruNeKifaransa()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded, color: Colors.blue),
              title: const Text('Kifuliiru-Kingereza'),
              hoverColor: Colors.greenAccent.shade700,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KifuliiruNeKingereza()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.list_rounded, color: Colors.blue),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Imyazi'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Imyazi()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer, color: Colors.blue),
              title: const Text('Twehe'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Twehe()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.web_rounded, color: Colors.blue),
              title: const Text('Namuyehuulo witu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SiteWebYitu()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.radio, color: Colors.blue),
              title: const Text('Radio Ibufuliiru'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RadioIbufuliiru()),
                );
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              trailing: Icon(Icons.dark_mode),
              title: Text('Hindula'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Ndondeezo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.radio,
              color: Colors.black,
            ),
            label: 'Radio Ibufuliiru',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              color: Colors.black,
            ),
            label: 'Myazi mu Kifuliiru',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.info_outlined,
                color: Colors.blue,
              ),
              label: 'Twehe'),
        ],
        onTap: (int index) {
          setState(() {
            navigationIndex = index;
            switch (navigationIndex) {
              case 0:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RadioIbufuliiru()));
                break;
              case 2:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Imyazi()));
                break;
              case 3:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Twehe()));
                break;
            }
          });
        },
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:kifuliiru_app/abaami.dart';
import 'package:kifuliiru_app/bafuliiru.dart';
import 'package:kifuliiru_app/ibufuliiru.dart';
import 'package:kifuliiru_app/utwaya.dart';

import 'about_screen.dart';
import 'add_words_screen.dart';
import 'amagambo.dart';
import 'contribute_screen.dart';
import 'diaspora_screen.dart';
import 'learning_screen.dart';
import 'study_tools_screen.dart';
import 'teachers_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //int _currentNewsIndex = 0;
  final List<Map<String, String>> _newsItems = [
    {
      'title': 'Muhumanano gwe misore yitu 2024',
      'description':
          'Guno guliri muhumanano gwe misore ye Kifuliiru mu Amerika',
      'image': 'assets/images/festival.jpg',
    },
    {
      'title': 'Kifuliiru.net',
      'description': 'Twaloonga ugundi namuyehuulo mu Kifuliiru',
      'image': 'assets/images/festival.jpg',
    },
    {
      'title': 'Ibufuliiru.net',
      'description': 'Kibaaja kihyahya higulu lye Kifuliiru',
      'image': 'assets/images/festival.jpg',
    },
    // Add more news items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kifuliiru Ndeto Yitu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 25, 248),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(),
            _buildNewsCarousel(),
            _buildSectionTitle('Akalaga kitu'),
            _buildCulturalHeritageGrid(),
            _buildSectionTitle('Kifuliiru'),
            _buildLanguageResourcesGrid(),
            _buildSectionTitle('Communauté'),
            _buildCommunityGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return const Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Muyegerere ku kibaaja kye Kifuliiru',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Tuliri Bafuliiru, tumusima i Kifuliiru. Kibaaja kitu kino.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Handle news item tap
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(_newsItems[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _newsItems[index]['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _newsItems[index]['description']!,
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: _newsItems.length,
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.blue,
                color: Colors.grey,
              ),
            ),
            autoplay: true,
            autoplayDelay: 3000,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2C4356),
        ),
      ),
    );
  }

  Widget _buildGridButton({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCulturalHeritageGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildGridButton(
          icon: Icons.account_balance,
          title: 'Bafuliiru',
          color: Colors.brown,
          onPressed: () => _handleNavigation('bafuliiru'),
        ),
        _buildGridButton(
          //Removed Icons.crown
          icon: Icons.person,
          title: 'Abaami',
          color: Colors.amber,
          onPressed: () => _handleNavigation('kings'),
        ),
        _buildGridButton(
          icon: Icons.location_on,
          title: 'Ibufuliiru',
          color: Colors.pink,
          onPressed: () => _handleNavigation('ibufuliiru'),
        ),
        _buildGridButton(
          icon: Icons.house,
          title: 'Utwaya',
          color: Colors.green,
          onPressed: () => _handleNavigation('villages'),
        ),
      ],
    );
  }

  Widget _buildLanguageResourcesGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildGridButton(
          icon: Icons.book,
          title: 'Kifuliiru',
          color: Colors.blue,
          onPressed: () => _handleNavigation('dictionary'),
        ),
        _buildGridButton(
          icon: Icons.book,
          title: 'Sobaanura',
          color: Colors.blue,
          onPressed: () => _handleNavigation('dictionary'),
        ),
        _buildGridButton(
          icon: Icons.school,
          title: 'Tusome',
          color: Colors.purple,
          onPressed: () => _handleNavigation('learn'),
        ),
        _buildGridButton(
          icon: Icons.person,
          title: 'Abaalimu',
          color: Colors.orange,
          onPressed: () => _handleNavigation('teachers'),
        ),
        _buildGridButton(
          icon: Icons.build,
          title: 'Soma',
          color: Colors.teal,
          onPressed: () => _handleNavigation('study_tools'),
        ),
      ],
    );
  }

  Widget _buildCommunityGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildGridButton(
          icon: Icons.public,
          title: 'Imahaanga',
          color: Colors.green,
          onPressed: () => _handleNavigation('diaspora'),
        ),
        _buildGridButton(
          icon: Icons.add_circle,
          title: 'Tugwaase',
          color: Colors.blue,
          onPressed: () => _handleNavigation('add_words'),
        ),
        _buildGridButton(
          icon: Icons.volunteer_activism,
          title: 'Tutabaale',
          color: Colors.orange,
          onPressed: () => _handleNavigation('contribute'),
        ),
        _buildGridButton(
          icon: Icons.info,
          title: 'Twehe',
          color: Colors.purple,
          onPressed: () => _handleNavigation('about'),
        ),
      ],
    );
  }

  void _handleNavigation(String route) {
    switch (route) {
      // Cultural Heritage
      case 'bafuliiru':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BafuliiruScreen(
              title: 'Bafuliiru History & People',
            ),
          ),
        );
        break;
      case 'kings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const KingsScreen(
              title: 'Royal Lineage',
            ),
          ),
        );
        break;
      case 'ibufuliiru':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomelandScreen(
              title: 'Ibufuliiru - Our Homeland',
            ),
          ),
        );
        break;
      case 'villages':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VillagesScreen(
              title: 'Villages & Towns',
            ),
          ),
        );
        break;

      // Language Resources
      case 'dictionary':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DictionaryScreen(
              title: 'Kifuliiru Dictionary',
            ),
          ),
        );
        break;
      case 'learn':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LearningScreen(
              title: 'Learn Kifuliiru',
            ),
          ),
        );
        break;
      case 'teachers':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TeachersScreen(),
          ),
        );
        break;
      case 'study_tools':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StudyToolsScreen(
              title: 'Study Tools',
            ),
          ),
        );
        break;

      // Community
      case 'diaspora':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DiasporaScreen(
              title: 'Kifuliiru Diaspora',
            ),
          ),
        );
        break;
      case 'add_words':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddWordsScreen(
              title: 'Add Words',
            ),
          ),
        );
        break;
      case 'contribute':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ContributeScreen(
              title: 'Contribute',
            ),
          ),
        );
        break;
      case 'about':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AboutScreen(
              title: 'About Kifuliiru',
            ),
          ),
        );
        break;
      default:
        debugPrint('Unknown route: $route');
    }
  }
}
