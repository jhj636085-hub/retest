import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TestMaster());
}

// =====================================================
// ASOSIY ILOVA
// =====================================================

class TestMaster extends StatelessWidget {
  const TestMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST MASTER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF3F7FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1769D2),
          primary: const Color(0xFF1769D2),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF3F7FF),
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shadowColor: Color(0x141769D2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// =====================================================
// MA'LUMOTLAR BAZASI
// =====================================================

class Store {
  // Yangi kalit: eski 12 ta savol o'rniga 120 ta savol yuklanadi.
  static const subjectsKey = 'tm_subjects_v3';
  static const resultsKey = 'tm_results_v2';

  static Future<SharedPreferences> get prefs async =>
      SharedPreferences.getInstance();

  static List<Map<String, dynamic>> defaults() {
    final names = [
      'Mobil ilovalar',
      'Dasturlash',
      'Operatsion tizimlar',
      'Matematika',
      'Fizika',
      'Ma’lumotlar bazasi',
    ];

    final questions = [
      // 1. MOBIL ILOVALAR
      [
        ['Flutter nima?', ['Dasturlash freymvorki', 'Operatsion tizim', 'Brauzer', 'Ma’lumotlar bazasi'], 0],
        ['Dart qaysi kompaniya tomonidan yaratilgan?', ['Apple', 'Google', 'Microsoft', 'Meta'], 1],
        ['Flutter qaysi dasturlash tilidan foydalanadi?', ['Java', 'Python', 'Dart', 'C++'], 2],
        ['Android ilovalarini yaratishda qaysi muhit ishlatiladi?', ['Android Studio', 'Excel', 'Photoshop', 'Word'], 0],
        ['APK fayli nima?', ['Rasm fayli', 'Android ilova paketi', 'Matn fayli', 'Audio fayl'], 1],
        ['Mobil ilova nima?', ['Telefon uchun dastur', 'Kompyuter qurilmasi', 'Internet kabeli', 'Operatsion tizim'], 0],
        ['Flutterda asosiy interfeys elementi nima deb ataladi?', ['Widget', 'Table', 'Folder', 'File'], 0],
        ['StatelessWidget qanday widget?', ['Holati o‘zgarmaydigan', 'Doimiy o‘zgaradigan', 'Ma’lumotlar bazasi', 'Server'], 0],
        ['StatefulWidget qanday widget?', ['Holati o‘zgaradigan', 'Faqat matn chiqaradigan', 'Rasm fayli', 'Brauzer'], 0],
        ['Flutterda ilova ishga tushirish funksiyasi?', ['main()', 'start()', 'run()', 'open()'], 0],
        ['MaterialApp nima uchun ishlatiladi?', ['Ilovaning asosiy tuzilishi uchun', 'Rasm chizish uchun', 'Fayl o‘chirish uchun', 'Internetni uzish uchun'], 0],
        ['Scaffold nima vazifani bajaradi?', ['Sahifa tuzilishini beradi', 'Ma’lumotni o‘chiradi', 'Telefonni o‘chiradi', 'Faylni siqadi'], 0],
        ['Text widget nima qiladi?', ['Matn chiqaradi', 'Rasm yuklaydi', 'Ovoz yozadi', 'Fayl o‘chiradi'], 0],
        ['Image widget nima uchun?', ['Rasm ko‘rsatish', 'Matn kiritish', 'Hisoblash', 'Internet ulash'], 0],
        ['Navigator nima uchun ishlatiladi?', ['Sahifalar orasida o‘tish', 'Matnni tarjima qilish', 'Rasmni tahrirlash', 'Ovoz yozish'], 0],
        ['ListView nima vazifani bajaradi?', ['Ro‘yxatni ko‘rsatadi', 'Kalkulyator yaratadi', 'Faylni o‘chiradi', 'Telefonni bloklaydi'], 0],
        ['Column widget elementlarni qanday joylashtiradi?', ['Vertikal', 'Gorizontal', 'Aylana shaklida', 'Tasodifiy'], 0],
        ['Row widget elementlarni qanday joylashtiradi?', ['Gorizontal', 'Vertikal', 'Faqat aylana', 'Ko‘rinmas'], 0],
        ['pubspec.yaml fayli nima uchun kerak?', ['Loyiha sozlamalari va paketlar uchun', 'Rasm chizish uchun', 'Test ishlash uchun', 'Telefonni boshqarish uchun'], 0],
        ['Hot Reload nima imkoniyat beradi?', ['O‘zgarishlarni tez ko‘rish', 'Ilovani o‘chirish', 'Internetni uzish', 'Faylni siqish'], 0],
      ],

      // 2. DASTURLASH
      [
        ['Python dastur fayli kengaytmasi?', ['.html', '.py', '.css', '.sql'], 1],
        ['print() vazifasi?', ['Chiqarish', 'Kiritish', 'O‘chirish', 'Saqlash'], 0],
        ['Python dasturlash tilimi?', ['Ha', 'Yo‘q', 'Faqat brauzer', 'Faqat operatsion tizim'], 0],
        ['O‘zgaruvchi nima?', ['Ma’lumot saqlovchi nom', 'Kompyuter qurilmasi', 'Internet sayti', 'Rasm turi'], 0],
        ['input() funksiyasi nima qiladi?', ['Ma’lumot kiritadi', 'Ma’lumot chiqaradi', 'Fayl o‘chiradi', 'Dasturni yopadi'], 0],
        ['if operatori nima uchun?', ['Shartni tekshirish', 'Takrorlash', 'Fayl ochish', 'Matn chiqarish'], 0],
        ['for operatori nima uchun ishlatiladi?', ['Takrorlash', 'Shartni o‘chirish', 'Rasm yaratish', 'Dastur o‘rnatish'], 0],
        ['while operatori nima?', ['Takrorlash operatori', 'Ma’lumot turi', 'Fayl kengaytmasi', 'Dastur muhiti'], 0],
        ['Python ro‘yxati qanday yoziladi?', ['[]', '{}', '()', '<>'], 0],
        ['Python lug‘ati qanday yoziladi?', ['{}', '[]', '()', '<>'], 0],
        ['len() funksiyasi nima qiladi?', ['Uzunlikni aniqlaydi', 'Sonni ko‘paytiradi', 'Faylni ochadi', 'Dasturni yopadi'], 0],
        ['int() nima qiladi?', ['Butun songa aylantiradi', 'Matn chiqaradi', 'Rasm yaratadi', 'Fayl o‘chiradi'], 0],
        ['str() nima qiladi?', ['Matnga aylantiradi', 'Butun songa aylantiradi', 'Sonni bo‘ladi', 'Dasturni to‘xtatadi'], 0],
        ['Funksiya yaratish uchun qaysi kalit so‘z ishlatiladi?', ['def', 'for', 'if', 'class'], 0],
        ['return nima vazifani bajaradi?', ['Funksiyadan qiymat qaytaradi', 'Siklni boshlaydi', 'Faylni o‘chiradi', 'Matn kiritadi'], 0],
        ['break operatori nima qiladi?', ['Siklni to‘xtatadi', 'Siklni boshlaydi', 'Sonni qo‘shadi', 'Matn chiqaradi'], 0],
        ['continue operatori nima qiladi?', ['Keyingi takrorlanishga o‘tadi', 'Dasturni o‘chiradi', 'Faylni yopadi', 'Sonni chiqaradi'], 0],
        ['Python dasturida izoh belgisi?', ['#', '//', '/*', '\$'], 0],
        ['2 ** 3 natijasi nechaga teng?', ['6', '8', '9', '5'], 1],
        ['Python qaysi turdagi til?', ['Yuqori darajali dasturlash tili', 'Operatsion tizim', 'Brauzer', 'Ma’lumotlar bazasi'], 0],
      ],

      // 3. OPERATSION TIZIMLAR
      [
        ['Operatsion tizim nima?', ['Kompyuter resurslarini boshqaruvchi dastur', 'Matn muharriri', 'Brauzer', 'O‘yin'], 0],
        ['Windows qaysi turdagi tizim?', ['Operatsion tizim', 'Antivirus', 'Brauzer', 'Dasturlash tili'], 0],
        ['Windows operatsion tizimini kim ishlab chiqaradi?', ['Microsoft', 'Google', 'Apple', 'Intel'], 0],
        ['Linux qanday operatsion tizim?', ['Ochiq kodli', 'Faqat pullik', 'Brauzer', 'Matn muharriri'], 0],
        ['macOS qaysi kompaniya mahsuloti?', ['Apple', 'Microsoft', 'Google', 'Samsung'], 0],
        ['Operatsion tizimning asosiy vazifasi nima?', ['Resurslarni boshqarish', 'Rasm chizish', 'Faqat musiqa tinglash', 'Video montaj'], 0],
        ['Kompyuter ishga tushganda qaysi jarayon boshlanadi?', ['Yuklanish', 'Chop etish', 'Arxivlash', 'Formatlash'], 0],
        ['Desktop nima?', ['Ish stoli', 'Qattiq disk', 'Protsessor', 'Klaviatura'], 0],
        ['Taskbar nima?', ['Vazifalar paneli', 'Fayl turi', 'Disk nomi', 'Dasturlash tili'], 0],
        ['Recycle Bin nima uchun?', ['O‘chirilgan fayllarni saqlash', 'Internetga ulanish', 'Rasm yaratish', 'Dastur yozish'], 0],
        ['File Explorer vazifasi nima?', ['Fayllarni boshqarish', 'Video ko‘rish', 'Musiqa yozish', 'Internet tarqatish'], 0],
        ['Ctrl + C tugmalari nima qiladi?', ['Nusxalaydi', 'Joylashtiradi', 'O‘chiradi', 'Saqlaydi'], 0],
        ['Ctrl + V tugmalari nima qiladi?', ['Joylashtiradi', 'Nusxalaydi', 'Bekor qiladi', 'Chop etadi'], 0],
        ['Ctrl + Z tugmalari nima qiladi?', ['Oxirgi amalni bekor qiladi', 'Faylni saqlaydi', 'Matnni nusxalaydi', 'Kompyuterni o‘chiradi'], 0],
        ['GUI nimani anglatadi?', ['Grafik foydalanuvchi interfeysi', 'Global internet tarmog‘i', 'Dasturlash tili', 'Qattiq disk turi'], 0],
        ['CLI nima?', ['Buyruq satri interfeysi', 'Grafik muharrir', 'Antivirus', 'Brauzer'], 0],
        ['Drayver nima?', ['Qurilma bilan tizim aloqasini ta’minlovchi dastur', 'Rasm fayli', 'O‘yin', 'Matn muharriri'], 0],
        ['BIOS yoki UEFI nima uchun?', ['Kompyuter ishga tushishini boshqarish', 'Matn yozish', 'Internet ko‘rish', 'Rasm tahrirlash'], 0],
        ['Multitasking nima?', ['Bir nechta vazifani bajarish', 'Bitta faylni o‘chirish', 'Faqat o‘yin o‘ynash', 'Kompyuterni bloklash'], 0],
        ['RAM qanday xotira?', ['Tezkor xotira', 'Doimiy tashqi xotira', 'Optik disk', 'Internet xotirasi'], 0],
      ],

      // 4. MATEMATIKA
      [
        ['5 + 7 = ?', ['10', '11', '12', '13'], 2],
        ['9 × 6 = ?', ['45', '54', '56', '64'], 1],
        ['15 - 8 = ?', ['5', '6', '7', '8'], 2],
        ['48 : 6 = ?', ['6', '7', '8', '9'], 2],
        ['12 × 12 = ?', ['124', '144', '132', '154'], 1],
        ['100 ning 10 foizi nechaga teng?', ['5', '10', '15', '20'], 1],
        ['Kvadratning nechta tomoni bor?', ['3', '4', '5', '6'], 1],
        ['Uchburchak burchaklari yig‘indisi?', ['90°', '180°', '270°', '360°'], 1],
        ['1 kilometr necha metr?', ['100', '500', '1000', '10000'], 2],
        ['2 ning 5-darajasi nechaga teng?', ['10', '16', '25', '32'], 3],
        ['√81 nechaga teng?', ['7', '8', '9', '10'], 2],
        ['3x = 15 bo‘lsa, x nechaga teng?', ['3', '4', '5', '6'], 2],
        ['Eng kichik tub son qaysi?', ['1', '2', '3', '4'], 1],
        ['Aylana uzunligi formulasi?', ['2πr', 'πr²', 'a²', 'ab'], 0],
        ['To‘g‘ri to‘rtburchak yuzi formulasi?', ['a + b', 'a × b', '2(a+b)', 'a²'], 1],
        ['7² nechaga teng?', ['14', '21', '49', '56'], 2],
        ['0 ga 25 qo‘shilsa nima bo‘ladi?', ['0', '25', '1', '50'], 1],
        ['1/2 kasrining o‘nli ko‘rinishi?', ['0.2', '0.5', '1.2', '2.0'], 1],
        ['200 ning 25 foizi nechaga teng?', ['25', '40', '50', '75'], 2],
        ['90° burchak qanday ataladi?', ['O‘tkir', 'To‘g‘ri', 'O‘tmas', 'Yoyiq'], 1],
      ],

      // 5. FIZIKA
      [
        ['Kuch birligi?', ['Nyuton', 'Joul', 'Vatt', 'Amper'], 0],
        ['Tok kuchi birligi?', ['Volt', 'Amper', 'Om', 'Vatt'], 1],
        ['Kuchlanish birligi?', ['Volt', 'Amper', 'Nyuton', 'Joul'], 0],
        ['Qarshilik birligi?', ['Om', 'Volt', 'Vatt', 'Joul'], 0],
        ['Quvvat birligi?', ['Vatt', 'Nyuton', 'Amper', 'Metr'], 0],
        ['Energiya birligi?', ['Joul', 'Volt', 'Amper', 'Om'], 0],
        ['Tezlik formulasi?', ['v = s/t', 'v = m×a', 'v = F/s', 'v = t/s'], 0],
        ['Tezlanish birligi?', ['m/s²', 'm/s', 'kg', 'N'], 0],
        ['Yerning tortishish tezlanishi taxminan?', ['9.8 m/s²', '5 m/s²', '15 m/s²', '20 m/s²'], 0],
        ['Suvning normal atmosfera bosimidagi qaynash harorati?', ['50°C', '80°C', '100°C', '120°C'], 2],
        ['Yorug‘lik tezligi vakuumda taxminan?', ['300 000 km/s', '30 km/s', '300 km/s', '3000 km/s'], 0],
        ['Elektr toki nima?', ['Zaryadlangan zarrachalarning tartibli harakati', 'Issiqlik almashinuvi', 'Tovush tarqalishi', 'Jismning harakati'], 0],
        ['Ampermetr nimani o‘lchaydi?', ['Tok kuchini', 'Kuchlanishni', 'Qarshilikni', 'Haroratni'], 0],
        ['Voltmetr nimani o‘lchaydi?', ['Kuchlanishni', 'Tok kuchini', 'Massani', 'Tezlikni'], 0],
        ['Dinamometr nimani o‘lchaydi?', ['Kuchni', 'Haroratni', 'Vaqtni', 'Tokni'], 0],
        ['Massa birligi?', ['Kilogramm', 'Metr', 'Sekund', 'Nyuton'], 0],
        ['Vaqtning SI birligi?', ['Sekund', 'Soat', 'Kun', 'Minut'], 0],
        ['Bosim birligi?', ['Paskal', 'Joul', 'Vatt', 'Amper'], 0],
        ['Zichlik formulasi?', ['ρ = m/V', 'ρ = F/S', 'ρ = s/t', 'ρ = U/I'], 0],
        ['Magnitning nechta qutbi bor?', ['1', '2', '3', '4'], 1],
      ],

      // 6. MA'LUMOTLAR BAZASI
      [
        ['SQL nima?', ['So‘rovlar tili', 'Operatsion tizim', 'Brauzer', 'Protsessor'], 0],
        ['SELECT nima qiladi?', ['Ma’lumot oladi', 'Jadval o‘chiradi', 'Bazani yopadi', 'Server yoqadi'], 0],
        ['Ma’lumotlar bazasi nima?', ['Tartiblangan ma’lumotlar to‘plami', 'Faqat rasm', 'Operatsion tizim', 'Kompyuter qurilmasi'], 0],
        ['Jadval nima?', ['Qator va ustunlardan tashkil topgan tuzilma', 'Rasm fayli', 'Dasturlash tili', 'Internet sayti'], 0],
        ['INSERT buyrug‘i nima qiladi?', ['Yangi ma’lumot qo‘shadi', 'Ma’lumot o‘chiradi', 'Jadvalni yopadi', 'Ma’lumot qidiradi'], 0],
        ['UPDATE buyrug‘i nima qiladi?', ['Ma’lumotni yangilaydi', 'Jadval yaratadi', 'Bazani o‘chiradi', 'Ma’lumotni ko‘rsatadi'], 0],
        ['DELETE buyrug‘i nima qiladi?', ['Ma’lumotni o‘chiradi', 'Ma’lumot qo‘shadi', 'Jadval yaratadi', 'Ma’lumotni saralaydi'], 0],
        ['CREATE TABLE nima qiladi?', ['Jadval yaratadi', 'Jadvalni o‘chiradi', 'Ma’lumotni yangilaydi', 'Bazani yopadi'], 0],
        ['PRIMARY KEY nima?', ['Birlamchi kalit', 'Oddiy matn', 'Jadval nomi', 'Fayl turi'], 0],
        ['FOREIGN KEY nima?', ['Tashqi kalit', 'Birlamchi kalit', 'Jadval sarlavhasi', 'Ma’lumot turi'], 0],
        ['WHERE nima uchun ishlatiladi?', ['Shart asosida tanlash', 'Jadval yaratish', 'Ma’lumot qo‘shish', 'Bazani yopish'], 0],
        ['ORDER BY nima qiladi?', ['Natijalarni saralaydi', 'Ma’lumot o‘chiradi', 'Jadval yaratadi', 'Bazani yopadi'], 0],
        ['COUNT() funksiyasi nima qiladi?', ['Qatorlar sonini hisoblaydi', 'O‘rtacha qiymatni topadi', 'Eng kattasini topadi', 'Ma’lumot o‘chiradi'], 0],
        ['AVG() funksiyasi nima qiladi?', ['O‘rtacha qiymatni hisoblaydi', 'Qatorlarni sanaydi', 'Eng kichik qiymatni topadi', 'Jadval yaratadi'], 0],
        ['MAX() funksiyasi nima qiladi?', ['Eng katta qiymatni topadi', 'Eng kichik qiymatni topadi', 'Qatorlarni sanaydi', 'Ma’lumot qo‘shadi'], 0],
        ['MIN() funksiyasi nima qiladi?', ['Eng kichik qiymatni topadi', 'Eng katta qiymatni topadi', 'Jadval yaratadi', 'Ma’lumot o‘chiradi'], 0],
        ['NOT NULL nimani bildiradi?', ['Qiymat bo‘sh bo‘lmasligi kerak', 'Qiymat faqat nol bo‘ladi', 'Jadval o‘chadi', 'Kalit yaratiladi'], 0],
        ['LIKE operatori nima uchun?', ['Matn bo‘yicha moslik qidirish', 'Jadval yaratish', 'Ma’lumot o‘chirish', 'Sonlarni qo‘shish'], 0],
        ['JOIN nima uchun ishlatiladi?', ['Jadvallarni bog‘lash', 'Jadvalni o‘chirish', 'Bazani yopish', 'Ma’lumotni chop etish'], 0],
        ['SQLite qanday ma’lumotlar bazasi?', ['Yengil, faylga asoslangan baza', 'Operatsion tizim', 'Brauzer', 'Dasturlash tili'], 0],
      ],
    ];

    return List.generate(names.length, (i) {
      return {
        'id': 'subject_$i',
        'name': names[i],
        'questions': List.generate(questions[i].length, (j) {
          final item = questions[i][j];
          return {
            'question': item[0],
            'options': item[1],
            'correct': item[2],
          };
        }),
      };
    });
  }

  static Future<List<Map<String, dynamic>>> loadSubjects() async {
    final p = await prefs;
    final raw = p.getString(subjectsKey);

    if (raw == null) {
      final data = defaults();
      await saveSubjects(data);
      return data;
    }

    return (jsonDecode(raw) as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  static Future<void> saveSubjects(
    List<Map<String, dynamic>> data,
  ) async {
    final p = await prefs;
    await p.setString(subjectsKey, jsonEncode(data));
  }

  static Future<List<Map<String, dynamic>>> loadResults() async {
    final p = await prefs;
    final raw = p.getString(resultsKey);

    if (raw == null) return [];

    return (jsonDecode(raw) as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  static Future<void> saveResult(Map<String, dynamic> result) async {
    final list = await loadResults();
    list.insert(0, result);

    final p = await prefs;
    await p.setString(resultsKey, jsonEncode(list));
  }
}

// =====================================================
// BOSH SAHIFA
// =====================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> subjects = [];
  List<Map<String, dynamic>> results = [];
  bool loading = true;

  final List<IconData> subjectIcons = [
    Icons.phone_android,
    Icons.code,
    Icons.desktop_windows,
    Icons.calculate,
    Icons.science,
    Icons.storage,
  ];

  final List<Color> subjectColors = [
    const Color(0xFF1769D2),
    const Color(0xFF8B5CF6),
    const Color(0xFF0891B2),
    const Color(0xFF16A34A),
    const Color(0xFFEA580C),
    const Color(0xFFDB2777),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final loadedSubjects = await Store.loadSubjects();
      final loadedResults = await Store.loadResults();

      if (!mounted) return;

      setState(() {
        subjects = loadedSubjects;
        results = loadedResults;
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ma’lumotlarni yuklashda xato: $e')),
      );
    }
  }

  Future<void> saveSubjects() async {
    await Store.saveSubjects(subjects);
    await loadData();
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Future<void> startQuiz(Map<String, dynamic> subject) async {
    final questions = (subject['questions'] as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();

    if (questions.isEmpty) {
      showMessage('Bu fanda hali savollar yo‘q');
      return;
    }

    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => QuizPage(
          subjectName: subject['name'].toString(),
          questions: questions,
        ),
      ),
    );

    if (result != null && mounted) {
      await Store.saveResult(result);

      if (!mounted) return;

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ReviewPage(result: result),
        ),
      );

      await loadData();
    }
  }

  Future<void> openAdmin() async {
    final pin = TextEditingController();

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Admin panel'),
        content: TextField(
          controller: pin,
          obscureText: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'PIN-kod',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Bekor qilish'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx, pin.text == '1234');
            },
            child: const Text('Kirish'),
          ),
        ],
      ),
    );

    final enteredPin = pin.text;
    pin.dispose();

    if (ok == true && mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AdminPage(
            subjects: subjects,
            onSave: saveSubjects,
          ),
        ),
      );

      await loadData();
    } else if (ok == false && enteredPin.isNotEmpty && mounted) {
      showMessage('PIN-kod noto‘g‘ri');
    }
  }

  void openHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HistoryPage(results: results),
      ),
    );
  }

  Widget statCard(
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 25),
            const SizedBox(height: 7),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget subjectCard(int index) {
    final subject = subjects[index];
    final count = (subject['questions'] as List).length;
    final color = subjectColors[index % subjectColors.length];

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => startQuiz(subject),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE5ECF6)),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                subjectIcons[index % subjectIcons.length],
                color: color,
                size: 27,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subject['name'].toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.quiz_outlined, size: 14, color: color),
                const SizedBox(width: 5),
                Text(
                  '$count ta savol',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward, size: 17, color: color),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = subjects.fold<int>(
      0,
      (sum, subject) => sum + (subject['questions'] as List).length,
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 39,
              height: 39,
              decoration: BoxDecoration(
                color: const Color(0xFF1769D2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.school,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TEST MASTER',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  'Bilim sari bir qadam',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Natijalar',
            onPressed: openHistory,
            icon: const Icon(Icons.history),
          ),
          IconButton(
            tooltip: 'Admin panel',
            onPressed: openAdmin,
            icon: const Icon(Icons.admin_panel_settings_outlined),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadData,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 25),
                children: [
                  // RASMLI BANNER
                  Container(
                    height: 215,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFF1769D2),
                              child: const Icon(
                                Icons.school,
                                color: Colors.white,
                                size: 90,
                              ),
                            );
                          },
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF063B83).withOpacity(0.94),
                                const Color(0xFF1769D2).withOpacity(0.55),
                                Colors.transparent,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'BILIMINGIZNI\nSINAB KO‘RING!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  height: 1.2,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Fanni tanlang va testni boshlang.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 15),
                              FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF1769D2),
                                ),
                                onPressed: () {
                                  if (subjects.isNotEmpty) {
                                    startQuiz(subjects[0]);
                                  }
                                },
                                icon: const Icon(Icons.play_arrow),
                                label: const Text('Testni boshlash'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Umumiy statistika',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      statCard(
                        Icons.menu_book,
                        'Fanlar',
                        '${subjects.length}',
                        const Color(0xFF1769D2),
                      ),
                      const SizedBox(width: 10),
                      statCard(
                        Icons.quiz,
                        'Savollar',
                        '$totalQuestions',
                        const Color(0xFF16A34A),
                      ),
                      const SizedBox(width: 10),
                      statCard(
                        Icons.emoji_events,
                        'Natijalar',
                        '${results.length}',
                        const Color(0xFFEA580C),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Fanlar',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '${subjects.length} ta fan',
                        style: const TextStyle(
                          color: Color(0xFF1769D2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 13),

                  if (subjects.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Text('Hozircha fanlar mavjud emas'),
                      ),
                    ),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subjects.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.12,
                    ),
                    itemBuilder: (context, index) {
                      return subjectCard(index);
                    },
                  ),

                  const SizedBox(height: 20),

                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: openHistory,
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5EFFF),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.history,
                              color: Color(0xFF1769D2),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Test natijalari',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${results.length} ta bajarilgan test',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                            color: Color(0xFF1769D2),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Center(
                    child: Text(
                      'TEST MASTER • Bilim va muvaffaqiyat',
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// =====================================================
// TEST SAHIFASI — 20 DAQIQA
// =====================================================

class QuizPage extends StatefulWidget {
  final String subjectName;
  final List<Map<String, dynamic>> questions;

  const QuizPage({
    super.key,
    required this.subjectName,
    required this.questions,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int current = 0;
  final Map<int, int> answers = {};

  static const int testDurationSeconds = 20 * 60;

  int remainingSeconds = testDurationSeconds;
  Timer? countdownTimer;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!mounted || isFinished) {
          timer.cancel();
          return;
        }

        if (remainingSeconds <= 1) {
          setState(() {
            remainingSeconds = 0;
          });
          timer.cancel();
          finishQuiz(timeExpired: true);
        } else {
          setState(() {
            remainingSeconds--;
          });
        }
      },
    );
  }

  String get formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  void finishQuiz({bool timeExpired = false}) {
    if (isFinished) return;

    isFinished = true;
    countdownTimer?.cancel();

    int score = 0;

    for (int i = 0; i < widget.questions.length; i++) {
      if (answers[i] == widget.questions[i]['correct']) {
        score++;
      }
    }

    final result = {
      'subject': widget.subjectName,
      'score': score,
      'total': widget.questions.length,
      'percent': (score * 100 / widget.questions.length).round(),
      'date': DateTime.now().toString(),
      'timeExpired': timeExpired,
      'answers': answers.map(
        (key, value) => MapEntry(key.toString(), value),
      ),
      'questions': widget.questions,
    };

    Navigator.pop(context, result);
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[current];
    final options = List<String>.from(q['options'] as List);
    final selected = answers[current];
    final isLowTime = remainingSeconds <= 60;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isLowTime
                      ? Colors.red.shade100
                      : const Color(0xFFDCEBFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  formattedTime,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: isLowTime
                        ? Colors.red
                        : const Color(0xFF1769D2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (current + 1) / widget.questions.length,
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: isLowTime
                    ? Colors.red.shade50
                    : const Color(0xFFEAF2FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Qolgan vaqt',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isLowTime
                          ? Colors.red
                          : const Color(0xFF1769D2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17),
            Text(
              'Savol ${current + 1} / ${widget.questions.length}',
              style: const TextStyle(
                color: Color(0xFF1769D2),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              q['question'].toString(),
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            ...List.generate(options.length, (i) {
              return Card(
                color: selected == i
                    ? const Color(0xFFDCEBFF)
                    : Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: selected == i
                        ? const Color(0xFF1769D2)
                        : const Color(0xFFEAF1FA),
                    foregroundColor: selected == i
                        ? Colors.white
                        : const Color(0xFF1769D2),
                    child: Text(String.fromCharCode(65 + i)),
                  ),
                  title: Text(options[i]),
                  onTap: () {
                    setState(() => answers[current] = i);
                  },
                ),
              );
            }),
            const Spacer(),
            Row(
              children: [
                if (current > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() => current--);
                      },
                      child: const Text('Oldingi'),
                    ),
                  ),
                if (current > 0) const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: selected == null
                        ? null
                        : () {
                            if (current < widget.questions.length - 1) {
                              setState(() => current++);
                            } else {
                              finishQuiz();
                            }
                          },
                    child: Text(
                      current == widget.questions.length - 1
                          ? 'Yakunlash'
                          : 'Keyingi',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// TEST NATIJASI VA TAHLIL
// =====================================================

class ReviewPage extends StatelessWidget {
  final Map<String, dynamic> result;

  const ReviewPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final questions = (result['questions'] as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();

    final answers = Map<String, dynamic>.from(
      result['answers'] as Map,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Test natijasi')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Text(
                    result['subject'].toString(),
                    style: const TextStyle(fontSize: 19),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${result['score']} / ${result['total']}',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1769D2),
                    ),
                  ),
                  Text('Natija: ${result['percent']}%'),
                  if (result['timeExpired'] == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Vaqt tugagani sababli test avtomatik yakunlandi.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Savollar tahlili',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ...List.generate(questions.length, (i) {
            final q = questions[i];
            final options = List<String>.from(q['options'] as List);
            final correct = q['correct'] as int;
            final chosen = answers[i.toString()];
            final isCorrect = chosen == correct;

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${i + 1}. ${q['question']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sizning javobingiz: ${chosen == null ? 'Belgilanmagan' : options[chosen as int]}',
                      style: TextStyle(
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    Text(
                      'To‘g‘ri javob: ${options[correct]}',
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            );
          }),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Bosh sahifaga qaytish'),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// ADMIN PANEL
// =====================================================

class AdminPage extends StatefulWidget {
  final List<Map<String, dynamic>> subjects;
  final Future<void> Function() onSave;

  const AdminPage({
    super.key,
    required this.subjects,
    required this.onSave,
  });

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late List<Map<String, dynamic>> subjects;

  @override
  void initState() {
    super.initState();
    subjects = widget.subjects
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  Future<void> save() async {
    await Store.saveSubjects(subjects);
    await widget.onSave();

    if (mounted) setState(() {});
  }

  Future<String?> askText(
    String title, [
    String initial = '',
  ]) async {
    final controller = TextEditingController(text: initial);

    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Bekor'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx, controller.text.trim());
            },
            child: const Text('Saqlash'),
          ),
        ],
      ),
    );

    controller.dispose();
    return result;
  }

  Future<void> addSubject() async {
    final name = await askText('Yangi fan nomi');

    if (name == null || name.isEmpty) return;

    subjects.add({
      'id': DateTime.now().microsecondsSinceEpoch.toString(),
      'name': name,
      'questions': [],
    });

    await save();
  }

  Future<void> editSubject(int index) async {
    final name = await askText(
      'Fan nomini o‘zgartirish',
      subjects[index]['name'].toString(),
    );

    if (name == null || name.isEmpty) return;

    subjects[index]['name'] = name;
    await save();
  }

  Future<void> deleteSubject(int index) async {
    final yes = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Fanni o‘chirish'),
        content: const Text('Bu fan va uning savollari o‘chirilsinmi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Yo‘q'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Ha, o‘chirish'),
          ),
        ],
      ),
    );

    if (yes == true) {
      subjects.removeAt(index);
      await save();
    }
  }

  Future<void> editQuestion(
    int subjectIndex, [
    int? questionIndex,
  ]) async {
    final questions = subjects[subjectIndex]['questions'] as List;

    final old = questionIndex == null
        ? null
        : Map<String, dynamic>.from(
            questions[questionIndex] as Map,
          );

    final question = TextEditingController(
      text: old?['question']?.toString() ?? '',
    );

    final oldOptions = old == null ? <dynamic>[] : old['options'] as List;

    final options = List.generate(
      4,
      (i) => TextEditingController(
        text: old == null ? '' : oldOptions[i].toString(),
      ),
    );

    int correct = old?['correct'] as int? ?? 0;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialog) => AlertDialog(
          title: Text(
            old == null ? 'Savol qo‘shish' : 'Savolni tahrirlash',
          ),
          content: SizedBox(
            width: 440,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: question,
                    decoration: const InputDecoration(
                      labelText: 'Savol matni',
                    ),
                    maxLines: 2,
                  ),
                  ...List.generate(4, (i) {
                    return Row(
                      children: [
                        Radio<int>(
                          value: i,
                          groupValue: correct,
                          onChanged: (v) {
                            if (v != null) {
                              setDialog(() => correct = v);
                            }
                          },
                        ),
                        Expanded(
                          child: TextField(
                            controller: options[i],
                            decoration: InputDecoration(
                              labelText:
                                  '${String.fromCharCode(65 + i)} javob',
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  const Text(
                    'To‘g‘ri javobni chapdagi doira orqali belgilang.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Bekor'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Saqlash'),
            ),
          ],
        ),
      ),
    );

    if (ok != true) {
      question.dispose();
      for (final c in options) {
        c.dispose();
      }
      return;
    }

    if (question.text.trim().isEmpty ||
        options.any((e) => e.text.trim().isEmpty)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Barcha maydonlarni to‘ldiring'),
          ),
        );
      }

      question.dispose();
      for (final c in options) {
        c.dispose();
      }
      return;
    }

    final data = {
      'question': question.text.trim(),
      'options': options.map((e) => e.text.trim()).toList(),
      'correct': correct,
    };

    if (questionIndex == null) {
      questions.add(data);
    } else {
      questions[questionIndex] = data;
    }

    question.dispose();

    for (final c in options) {
      c.dispose();
    }

    await save();
  }

  Future<void> deleteQuestion(
    int subjectIndex,
    int questionIndex,
  ) async {
    final yes = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Savolni o‘chirish'),
        content: const Text('Ushbu savol o‘chirilsinmi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Bekor'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('O‘chirish'),
          ),
        ],
      ),
    );

    if (yes == true) {
      (subjects[subjectIndex]['questions'] as List)
          .removeAt(questionIndex);
      await save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin panel')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addSubject,
        icon: const Icon(Icons.add),
        label: const Text('Fan qo‘shish'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: subjects.length,
        itemBuilder: (context, i) {
          final s = subjects[i];
          final questions = s['questions'] as List;

          return Card(
            child: ExpansionTile(
              title: Text(
                s['name'].toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${questions.length} ta savol'),
              children: [
                Wrap(
                  children: [
                    TextButton.icon(
                      onPressed: () => editSubject(i),
                      icon: const Icon(Icons.edit),
                      label: const Text('Fan nomi'),
                    ),
                    TextButton.icon(
                      onPressed: () => deleteSubject(i),
                      icon: const Icon(Icons.delete, color: Colors.red),
                      label: const Text('Fanni o‘chirish'),
                    ),
                    TextButton.icon(
                      onPressed: () => editQuestion(i),
                      icon: const Icon(Icons.add),
                      label: const Text('Savol qo‘shish'),
                    ),
                  ],
                ),
                ...List.generate(questions.length, (j) {
                  final q = questions[j];

                  return ListTile(
                    title: Text('${j + 1}. ${q['question']}'),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit') {
                          editQuestion(i, j);
                        } else if (value == 'delete') {
                          deleteQuestion(i, j);
                        }
                      },
                      itemBuilder: (_) => const [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('Tahrirlash'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('O‘chirish'),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

// =====================================================
// NATIJALAR TARIXI
// =====================================================

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> results;

  const HistoryPage({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Natijalar tarixi'),
      ),
      body: results.isEmpty
          ? const Center(
              child: Text('Hozircha natijalar yo‘q'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: results.length,
              itemBuilder: (context, i) {
                final r = results[i];

                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.assignment_turned_in),
                    ),
                    title: Text(r['subject'].toString()),
                    subtitle: Text(
                      '${r['score']} / ${r['total']} ta to‘g‘ri\n${r['date']}',
                    ),
                    isThreeLine: true,
                    trailing: Text(
                      '${r['percent']}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1769D2),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}