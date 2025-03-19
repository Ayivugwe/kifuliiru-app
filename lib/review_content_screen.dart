import 'package:flutter/material.dart';
import 'package:kifuliiru_app/theme.dart';

class ReviewContentScreen extends StatelessWidget {
  const ReviewContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFEA580C), Color(0xFFEF4444)],
          ).createShader(bounds),
          child: const Text(
            'Review Content',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // Replace with actual submission count
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: KifuliiruTheme.primaryColor.withOpacity(0.1),
                        child: Icon(
                          Icons.person,
                          color: KifuliiruTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Submitted by John Doe',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '2 hours ago',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'New Word',
                          style: TextStyle(
                            color: KifuliiruTheme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Word: ${_getSampleWord(index)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Definition: ${_getSampleDefinition(index)}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle reject
                        },
                        child: const Text('Reject'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Handle approve
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KifuliiruTheme.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Approve'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getSampleWord(int index) {
    final words = [
      'Muhumanano',
      'Kuyandika',
      'Ibufuliiru',
      'Abafuliiru',
      'Kifuliiru',
      'Utwaya',
      'Bafuliiru',
      'Abaami',
      'Imigani',
      'Umwazi',
    ];
    return words[index % words.length];
  }

  String _getSampleDefinition(int index) {
    final definitions = [
      'A gathering or meeting of people',
      'The act of writing or documenting',
      'The homeland of the Kifuliiru people',
      'The Kifuliiru people',
      'The Kifuliiru language',
      'The villages of the Kifuliiru',
      'The Kifuliiru community',
      'The kings of the Kifuliiru',
      'Traditional stories and proverbs',
      'Knowledge and wisdom',
    ];
    return definitions[index % definitions.length];
  }
} 