import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';
import 'intro_screen.dart';
import 'package:kifuliiru_app/home.dart';
import 'package:kifuliiru_app/theme.dart';
import 'package:kifuliiru_app/dictionary_view_screen.dart';
import 'package:kifuliiru_app/learning_screen.dart';
import 'package:kifuliiru_app/kings_screen.dart';
import 'package:kifuliiru_app/homeland_screen.dart';
import 'package:kifuliiru_app/amagambo.dart';
import 'package:kifuliiru_app/theme_provider.dart';
import 'firebase_options.dart';
import 'providers/auth_provider.dart';
import 'screens/auth/sign_in_screen.dart';
import 'navigation/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  
  //await Supabase.initialize(url: 'https://jzylueotpenjojusudox.supabase.co', anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp6eWx1ZW90cGVuam9qdXN1ZG94Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTgwOTk3MTEsImV4cCI6MjAxMzY3NTcxMX0.KfapliWx6pFxGYmil2B2Gy0-aJtzV7kOMrhgU2lyvSA');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Kifuliiru',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainNavigation(), // Directly show MainNavigation without auth check
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _showBottomNav = true;

  final List<Widget> _screens = [
    const Home(),
    const DictionaryScreen(title: 'Kifuliiru Dictionary'),
    const LearningScreen(title: 'Learn Kifuliiru'),
    const KingsScreen(title: 'Royal Lineage'),
    const HomelandScreen(title: 'Ibufuliiru - Our Homeland'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _showBottomNav ? Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          indicatorColor: KifuliiruTheme.primaryColor.withOpacity(0.2),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: 'Dictionary',
            ),
            NavigationDestination(
              icon: Icon(Icons.school_outlined),
              selectedIcon: Icon(Icons.school),
              label: 'Learn',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline),
              selectedIcon: Icon(Icons.people),
              label: 'Abaami',
            ),
            NavigationDestination(
              icon: Icon(Icons.language_outlined),
              selectedIcon: Icon(Icons.language),
              label: 'Ibufuliiru',
            ),
          ],
        ),
      ) : null,
    );
  }
}
