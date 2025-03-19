import 'package:flutter/material.dart';
import 'package:kifuliiru_app/theme.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final _sourceController = TextEditingController();
  final _targetController = TextEditingController();
  String _sourceLanguage = 'Kifuliiru';
  String _targetLanguage = 'English';

  @override
  void dispose() {
    _sourceController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFEA580C), Color(0xFFEF4444)],
          ).createShader(bounds),
          child: const Text(
            'Translate',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildLanguageSelector(),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildTranslationCard(
                      title: _sourceLanguage,
                      controller: _sourceController,
                      onChanged: (value) {
                        // Handle translation
                        _targetController.text = 'Translated text will appear here';
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTranslationCard(
                      title: _targetLanguage,
                      controller: _targetController,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle submit translation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: KifuliiruTheme.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Submit Translation'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: _sourceLanguage,
            decoration: InputDecoration(
              labelText: 'From',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Kifuliiru',
                child: Text('Kifuliiru'),
              ),
              DropdownMenuItem(
                value: 'English',
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'French',
                child: Text('French'),
              ),
              DropdownMenuItem(
                value: 'Swahili',
                child: Text('Swahili'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _sourceLanguage = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: _targetLanguage,
            decoration: InputDecoration(
              labelText: 'To',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Kifuliiru',
                child: Text('Kifuliiru'),
              ),
              DropdownMenuItem(
                value: 'English',
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'French',
                child: Text('French'),
              ),
              DropdownMenuItem(
                value: 'Swahili',
                child: Text('Swahili'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _targetLanguage = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTranslationCard({
    required String title,
    required TextEditingController controller,
    bool readOnly = false,
    Function(String)? onChanged,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TextField(
                controller: controller,
                readOnly: readOnly,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: readOnly ? 'Translation will appear here' : 'Enter text to translate',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 