// models/news_item.dart
class NewsItem {
  final String id;
  final String title;
  final String description;
  final String content;
  final String image;
  final DateTime date;

  NewsItem({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.image,
    required this.date,
  });
}

final List<NewsItem> newsItems = [
  NewsItem(
    id: '1',
    title: 'Easy Weekend Meal Prep Ideas',
    description:
        'Save time and eat healthy with these simple meal prep strategies',
    content:
        'Meal prepping doesn\'t have to be complicated. With just two hours '
        'on Sunday, you can prepare healthy lunches for the entire week. Start with '
        'simple ingredients like grilled chicken, roasted vegetables, and quinoa. '
        'Mix and match these bases with different sauces and toppings to keep '
        'your meals interesting throughout the week.',
    image: 'assets/images/meal_prep.jpg',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NewsItem(
    id: '2',
    title: 'Creating a Cozy Reading Nook',
    description: 'Transform any corner into your perfect reading retreat',
    content: 'Everyone needs a comfortable space to unwind with a good book. '
        'Start with good lighting - a mix of natural light and a warm reading lamp. '
        'Add comfortable seating like a plush chair or floor cushions, some soft '
        'throws, and maybe a small side table for your tea. Don\'t forget a small '
        'bookshelf to keep your current reads within reach.',
    image: 'assets/images/reading_nook.jpg',
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  NewsItem(
    id: '3',
    title: 'Indoor Plants for Beginners',
    description: 'The best low-maintenance plants to brighten your home',
    content: 'Adding plants to your home doesn\'t require a green thumb. '
        'Snake plants, pothos, and ZZ plants are nearly indestructible and '
        'can thrive in various light conditions. These plants not only add '
        'life to your space but also help purify the air. Start with one '
        'or two plants and watch your confidence grow with your garden.',
    image: 'assets/images/plants.jpg',
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
  NewsItem(
    id: '4',
    title: 'Morning Routines That Work',
    description: 'Start your day right with these simple morning habits',
    content: 'A good morning routine sets the tone for your entire day. '
        'Instead of reaching for your phone first thing, try starting with '
        'a glass of water, five minutes of stretching, and a moment of '
        'quiet reflection. These small changes can make a big difference '
        'in your energy levels and productivity throughout the day.',
    image: 'assets/images/morning.jpg',
    date: DateTime.now().subtract(const Duration(days: 4)),
  ),
  NewsItem(
    id: '5',
    title: 'Weekend Family Activities',
    description: 'Fun and affordable ways to spend quality time together',
    content: 'Creating family memories doesn\'t require expensive trips. '
        'Try having a family game night with board games and homemade snacks, '
        'going on a local nature hike, or setting up a backyard camping '
        'adventure. The key is being present and engaged with each other, '
        'whether you\'re cooking together, crafting, or exploring your community.',
    image: 'assets/images/family.jpg',
    date: DateTime.now().subtract(const Duration(days: 5)),
  ),
];
