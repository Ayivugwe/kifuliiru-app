import 'package:flutter/material.dart';
import '../utils/translation_helper.dart';

class LanguageSelector extends StatelessWidget {
  final Function(String) onLanguageSelected;

  const LanguageSelector({
    Key? key,
    required this.onLanguageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translationHelper = TranslationHelper();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          translationHelper.translate('languages.select'),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ...TranslationHelper.supportedLocales.map((locale) {
          return FutureBuilder<double>(
            future: translationHelper.getTranslationCompletion(locale),
            builder: (context, snapshot) {
              final completion = snapshot.data ?? 0.0;
              final isComingSoon = locale == 'fll';
              
              return ListTile(
                title: Text(translationHelper.translate('languages.$locale')),
                subtitle: isComingSoon
                    ? Text(translationHelper.translate('languages.coming_soon'))
                    : Text('${completion.toStringAsFixed(1)}% Complete'),
                trailing: isComingSoon
                    ? const Icon(Icons.info_outline)
                    : const Icon(Icons.check_circle_outline),
                onTap: isComingSoon ? null : () => onLanguageSelected(locale),
              );
            },
          );
        }).toList(),
      ],
    );
  }
} 