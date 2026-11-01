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
  bool arabic = true;

  final List<Map<String, dynamic>> sections = [
    {'ar': 'التعليم والمعرفة', 'en': 'Education', 'icon': Icons.school, 'color': Colors.blue},
    {'ar': 'تنظيم الحياة', 'en': 'Daily Life', 'icon': Icons.calendar_month, 'color': Colors.orange},
    {'ar': 'إدارة الأموال', 'en': 'Finance', 'icon': Icons.account_balance_wallet, 'color': Colors.green},
    {'ar': 'الصحة', 'en': 'Health', 'icon': Icons.health_and_safety, 'color': Colors.red},
    {'ar': 'العمل والوظائف', 'en': 'Jobs & Work', 'icon': Icons.work, 'color': Colors.indigo},
    {'ar': 'التسوق والخدمات', 'en': 'Shopping', 'icon': Icons.shopping_bag, 'color': Colors.purple},
    {'ar': 'الكتب والقراءة', 'en': 'Books', 'icon': Icons.menu_book, 'color': Colors.brown},
    {'ar': 'المهارات والمواهب', 'en': 'Skills', 'icon': Icons.lightbulb, 'color': Colors.amber},
    {'ar': 'الذكاء الاصطناعي', 'en': 'Artificial Intelligence', 'icon': Icons.smart_toy, 'color': Colors.teal},
    {'ar': 'الخدمات العائلية', 'en': 'Family Services', 'icon': Icons.home, 'color': Colors.cyan},
    {'ar': 'التعافي', 'en': 'Recovery', 'icon': Icons.spa, 'color': Colors.deepOrange},
    {'ar': 'الصحة النفسية', 'en': 'Mental Wellbeing', 'icon': Icons.self_improvement, 'color': Colors.deepPurple},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF176B63),
        scaffoldBackgroundColor: const Color(0xFFF5F7F7),
      ),
      home: Directionality(
        textDirection: arabic ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('واو | WAW',
                style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () => setState(() => arabic = !arabic),
                child: Text(arabic ? 'English' : 'العربية'),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF176B63),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'واو حياتي WAW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      arabic
                          ? 'كل ما تحتاجه لحياتك الرقمية في مكان واحد.'
                          : 'Everything you need for your digital life in one place.',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Text(
                arabic ? 'اكتشف مجالات واو' : 'Explore WAW',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sections.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.18,
                ),
                itemBuilder: (context, index) {
                  final item = sections[index];
                  final color = item['color'] as Color;
                  return InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Directionality(
                            textDirection: arabic
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            child: Scaffold(
                              appBar: AppBar(
                                title: Text(arabic
                                    ? item['ar']
                                    : item['en']),
                              ),
                              body: Center(
                                child: Text(
                                  arabic
                                      ? 'مرحباً بك في مجال ${item['ar']}'
                                      : 'Welcome to ${item['en']}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: color.withOpacity(0.25),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item['icon'], color: color, size: 34),
                          const SizedBox(height: 10),
                          Text(
                            arabic ? item['ar'] : item['en'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
