import 'package:flutter/material.dart';

void main() {
  runApp(const WawApp());
}

class WawApp extends StatefulWidget {
  const WawApp({super.key});

  @override
  State<WawApp> createState() => _WawAppState();
}

class _WawAppState extends State<WawApp> {
  bool isArabic = true;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WAW',
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF172C48),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF172C48),
          brightness: Brightness.dark,
        ),
      ),
      home: Directionality(
        textDirection:
            isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: HomePage(
          isArabic: isArabic,
          isDark: isDark,
          onLanguage: () {
            setState(() => isArabic = !isArabic);
          },
          onTheme: () {
            setState(() => isDark = !isDark);
          },
        ),
      ),
    );
  }
}

class WawCategory {
  final String ar;
  final String en;
  final String descriptionAr;
  final String descriptionEn;
  final IconData icon;
  final Color color;

  const WawCategory(
    this.ar,
    this.en,
    this.descriptionAr,
    this.descriptionEn,
    this.icon,
    this.color,
  );
}

const List<WawCategory> categories = [
  WawCategory(
    'التعليم والمعرفة',
    'Education',
    'التعلم واكتساب المعرفة',
    'Learning and gaining knowledge',
    Icons.school_rounded,
    Color(0xFF3976B9),
  ),
  WawCategory(
    'تنظيم الحياة والوقت',
    'Life & Time',
    'تنظيم المهام والمواعيد',
    'Organizing tasks and schedules',
    Icons.calendar_month_rounded,
    Color(0xFF8B65B5),
  ),
  WawCategory(
    'إدارة الأموال',
    'Finance',
    'إدارة الميزانية والمصروفات',
    'Managing budgets and expenses',
    Icons.account_balance_wallet_rounded,
    Color(0xFF269B83),
  ),
  WawCategory(
    'الصحة والعادات',
    'Health & Habits',
    'العادات الصحية ونمط الحياة',
    'Healthy habits and lifestyle',
    Icons.health_and_safety_rounded,
    Color(0xFF3B9B70),
  ),
  WawCategory(
    'العمل والوظائف',
    'Work & Jobs',
    'الوظائف والفرص المهنية',
    'Jobs and career opportunities',
    Icons.work_rounded,
    Color(0xFF54718F),
  ),
  WawCategory(
    'التسوق والخدمات',
    'Shopping & Services',
    'التسوق ومقارنة الخدمات',
    'Shopping and comparing services',
    Icons.shopping_bag_rounded,
    Color(0xFFD18B42),
  ),
  WawCategory(
    'الكتب والقراءة',
    'Books & Reading',
    'الكتب والقراءة والمعرفة',
    'Books, reading and knowledge',
    Icons.menu_book_rounded,
    Color(0xFF9B704E),
  ),
  WawCategory(
    'المهارات والمواهب',
    'Skills & Talents',
    'اكتشاف المهارات وتطويرها',
    'Discovering and developing skills',
    Icons.lightbulb_rounded,
    Color(0xFFBA9A38),
  ),
  WawCategory(
    'الذكاء الاصطناعي',
    'Artificial Intelligence',
    'أدوات الذكاء الاصطناعي',
    'Artificial intelligence tools',
    Icons.memory_rounded,
    Color(0xFF5368C5),
  ),
  WawCategory(
    'الخدمات العائلية والشخصية',
    'Family & Personal',
    'خدمات الحياة الشخصية والعائلية',
    'Personal and family services',
    Icons.family_restroom_rounded,
    Color(0xFFB56C91),
  ),
  WawCategory(
    'التعافي',
    'Recovery',
    'المساعدة على بناء عادات أفضل',
    'Support for building better habits',
    Icons.spa_rounded,
    Color(0xFF579B91),
  ),
  WawCategory(
    'الصحة النفسية',
    'Mental Wellbeing',
    'التوعية والدعم النفسي',
    'Mental health awareness and support',
    Icons.self_improvement_rounded,
    Color(0xFF6487A8),
  ),
  WawCategory(
    'السفر والتنقّل والسياحة',
    'Travel & Tourism',
    'الرحلات والسياحة والفنادق والنقل',
    'Trips, tourism, hotels and transport',
    Icons.flight_takeoff_rounded,
    Color(0xFF328CBB),
  ),
  WawCategory(
    'المنزل والحياة اليومية',
    'Home & Daily Life',
    'الخدمات المنزلية والصيانة والتنظيم',
    'Home services, maintenance and organization',
    Icons.home_rounded,
    Color(0xFFB27B51),
  ),
  WawCategory(
    'الثقافة والترفيه',
    'Culture & Entertainment',
    'الثقافة والفعاليات والأنشطة',
    'Culture, events and activities',
    Icons.museum_rounded,
    Color(0xFF9871B8),
  ),
  WawCategory(
    'الخدمات الحكومية والقانونية',
    'Government & Legal Services',
    'الخدمات الرسمية والمعلومات القانونية',
    'Official services and legal information',
    Icons.account_balance_rounded,
    Color(0xFF657B91),
  ),
];

class HomePage extends StatefulWidget {
  final bool isArabic;
  final bool isDark;
  final VoidCallback onLanguage;
  final VoidCallback onTheme;

  const HomePage({
    super.key,
    required this.isArabic,
    required this.isDark,
    required this.onLanguage,
    required this.onTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filtered = categories.where((item) {
      final name = widget.isArabic ? item.ar : item.en;
      return name.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WAW',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: widget.onLanguage,
            icon: const Icon(Icons.language),
            tooltip: 'Language',
          ),
          IconButton(
            onPressed: widget.onTheme,
            icon: Icon(
              widget.isDark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
            tooltip: 'Theme',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 18),
            Text(
              widget.isArabic
                  ? 'مع واو، حياتي واو!'
                  : 'With WAW, life is WOW!',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF328CBB),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.isArabic
                  ? 'كل ما تحتاجه في تطبيق واحد'
                  : 'Everything you need in one app',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: TextField(
                onChanged: (value) {
                  setState(() => searchText = value);
                },
                decoration: InputDecoration(
                  hintText: widget.isArabic
                      ? 'ابحث عن مجال...'
                      : 'Search categories...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.12,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  return CategoryCard(
                    category: item,
                    isArabic: widget.isArabic,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final WawCategory category;
  final bool isArabic;

  const CategoryCard({
    super.key,
    required this.category,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final name = isArabic ? category.ar : category.en;
    final description =
        isArabic ? category.descriptionAr : category.descriptionEn;

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CategoryPage(
                category: category,
                isArabic: isArabic,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: category.color.withValues(alpha: 0.15),
                child: Icon(
                  category.icon,
                  color: category.color,
                  size: 27,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final WawCategory category;
  final bool isArabic;

  const CategoryPage({
    super.key,
    required this.category,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isArabic ? category.ar : category.en),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor:
                      category.color.withValues(alpha: 0.15),
                  child: Icon(
                    category.icon,
                    color: category.color,
                    size: 45,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  isArabic ? category.ar : category.en,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Text(
                  isArabic
                      ? category.descriptionAr
                      : category.descriptionEn,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  isArabic
                      ? 'سيتم تطوير خدمات هذا المجال وإضافتها تدريجيًا.'
                      : 'Services in this category will be added gradually.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
