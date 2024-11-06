import 'package:flutter/material.dart';

class AddWordsScreen extends StatelessWidget {
  final String title;
  const AddWordsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF2C4356),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        iconTheme: const IconThemeData(
          color: Color(0xFF2C4356), // Back arrow color
        ),
        centerTitle: true,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  title: 'Contribution Process',
                  icon: Icons.route,
                  content: _buildStepsList(),
                ),
                const SizedBox(height: 24),
                _buildSection(
                  title: 'Contribution Areas',
                  icon: Icons.category,
                  content: _buildContributionAreas(),
                ),
                const SizedBox(height: 24),
                _buildSection(
                  title: 'Language Proficiency Test',
                  icon: Icons.school,
                  content: _buildTestInfo(),
                ),
                const SizedBox(height: 24),
                _buildSection(
                  title: 'Quality Guidelines',
                  icon: Icons.verified,
                  content: _buildGuidelines(),
                ),
                // Add padding at bottom to avoid FAB overlap
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Launch sign up process
        },
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF2C4356),
        elevation: 4,
        icon: const Icon(Icons.person_add),
        label: const Text(
          'Become a Contributor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[50]!, // Very light grey, almost white
            Colors.grey[100]!, // Slightly darker shade
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ba Muguma wa Balya Abagweti Bagayandika',
            style: TextStyle(
              color: const Color(0xFF2C4356),
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tabaala ukubiika no kuhisa hala indeto yitu Kifuliiru mu kuba umwandisi uyemirwi',
            style: TextStyle(
              color: const Color(0xFF2C4356).withOpacity(0.85),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget content,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF2C4356), size: 24),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C4356),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }

  // Rest of the code remains the same...
  // (keeping all the other methods exactly as they were)

  Widget _buildStepsList() {
    final steps = [
      'Sign up as a potential contributor',
      'Select your preferred language(s) for contribution',
      'Complete the language proficiency test',
      'Get verified and receive contributor access',
      'Start contributing in your approved areas'
    ];

    return Column(
      children: steps.asMap().entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF2C4356),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${entry.key + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  entry.value,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContributionAreas() {
    final areas = [
      {
        'title': 'Dictionary Words',
        'icon': Icons.book,
        'description': 'Add new words, definitions, and usage examples'
      },
      {
        'title': 'News Translation',
        'icon': Icons.newspaper,
        'description': 'Translate news articles into multiple languages'
      },
      {
        'title': 'Cultural Content',
        'icon': Icons.people,
        'description': 'Document cultural practices and traditions'
      },
      {
        'title': 'Audio Recording',
        'icon': Icons.mic,
        'description': 'Record word pronunciations and stories'
      },
    ];

    return Column(
      children: areas.map((area) {
        return ListTile(
          leading:
              Icon(area['icon'] as IconData, color: const Color(0xFF2C4356)),
          title: Text(
            area['title'] as String,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C4356),
            ),
          ),
          subtitle: Text(area['description'] as String),
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildTestInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTestComponent(
          'Written Test',
          'Evaluate grammar, vocabulary, and writing skills',
        ),
        _buildTestComponent(
          'Spoken Test',
          'Assess pronunciation, fluency, and comprehension',
        ),
        _buildTestComponent(
          'Translation Test',
          'Check ability to translate between languages accurately',
        ),
        _buildTestComponent(
          'Cultural Knowledge',
          'Verify understanding of cultural context and usage',
        ),
      ],
    );
  }

  Widget _buildTestComponent(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF2C4356),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidelines() {
    return const Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.verified_user, color: Color(0xFF2C4356)),
          title: Text('Accuracy'),
          subtitle: Text('All contributions must be accurate and verified'),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.spellcheck, color: Color(0xFF2C4356)),
          title: Text('Proper Documentation'),
          subtitle: Text('Include sources and context for contributions'),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.group, color: Color(0xFF2C4356)),
          title: Text('Community Review'),
          subtitle: Text('Contributions undergo peer review process'),
        ),
      ],
    );
  }
}
