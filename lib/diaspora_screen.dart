// screens/diaspora_screen.dart
import 'package:flutter/material.dart';

import 'CountryDetailScreen.dart';
import 'data/countries_data.dart';
import 'models/buguma.dart';
import 'models/country.dart';

class DiasporaScreen extends StatelessWidget {
  const DiasporaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diaspora'),
        elevation: 0,
      ),
      body: const CountrySelectionView(),
    );
  }
}

// views/country_selection_view.dart
class CountrySelectionView extends StatefulWidget {
  const CountrySelectionView({Key? key}) : super(key: key);

  @override
  State<CountrySelectionView> createState() => _CountrySelectionViewState();
}

class _CountrySelectionViewState extends State<CountrySelectionView> {
  final TextEditingController _searchController = TextEditingController();
  List<Country> _filteredCountries = [];
  List<Country> _allCountries = [];

  @override
  void initState() {
    super.initState();
    _initializeCountries();
  }

  void _initializeCountries() {
    _allCountries = CountriesData.getAllCountries()
      ..sort((a, b) => a.name.compareTo(b.name)); // Sort alphabetically
    _filteredCountries = _allCountries;
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = _allCountries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find Bafuliiru Communities Worldwide',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                onChanged: _filterCountries,
                decoration: InputDecoration(
                  hintText: 'Search countries...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _filteredCountries.length,
            itemBuilder: (context, index) {
              final country = _filteredCountries[index];
              return _CountryCard(
                country: country,
                onTap: () => _navigateToCountryDetail(context, country),
              );
            },
          ),
        ),
      ],
    );
  }

  void _navigateToCountryDetail(BuildContext context, Country country) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountryDetailScreen(country: country),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// widgets/country_card.dart
class _CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const _CountryCard({
    Key? key,
    required this.country,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        title: Text(
          country.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: country.hasStates
            ? Text('${country.states.length} states/provinces')
            : null,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
