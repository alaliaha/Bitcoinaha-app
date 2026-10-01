import 'package:flutter/material.dart';

void main() {
  runApp(const BitcoinAhaApp());
}

class BitcoinAhaApp extends StatelessWidget {
  const BitcoinAhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BITCOINAHA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF121212),
        fontFamily: 'Roboto',
      ),
      // إعداد اتجاه النص من اليمين إلى اليسار للغة العربية
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: DashboardScreen(),
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isTradingActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BITCOINAHA - التداول الآلي'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1E1E),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة حالة التداول الآلي
            Card(
              color: const Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('حالة نظام المضاربة السريعة', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        const SizedBox(height: 6),
                        Text(
                          isTradingActive ? 'نشط يعمل الآن ⚡' : 'متوقف مؤقتًا ⏸️',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isTradingActive ? Colors.greenAccent : Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.precision_manufacturing_outlined,
                      size: 36,
                      color: isTradingActive ? Colors.amber : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // قسم المؤشرات المباشرة
            const Text('مؤشرات وإشارات المضاربة السريعة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            Expanded(
              child: ListView(
                children: [
                  _buildTile('تحليل الشارت والشبكة (RSI + MACD)', 'إشارة شراء قوية', Colors.greenAccent),
                  _buildTile('تتبع المحللين الـ 10 (Sentiment)', 'إيجابي (78%)', Colors.greenAccent),
                  _buildTile('حجم السيولة (Volume Profile)', 'مستوى مرتفع', Colors.amber),
                  _buildTile('إدارة المخاطر (Trailing Stop)', 'مفعل عند 1.2%', Colors.blueAccent),
                ],
              ),
            ),
            
            // زر التشغيل والإيقاف
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isTradingActive ? Colors.redAccent : Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  setState(() {
                    isTradingActive = !isTradingActive;
                  });
                },
                icon: Icon(isTradingActive ? Icons.pause : Icons.play_arrow),
                label: Text(
                  isTradingActive ? 'إيقاف التداول الآلي' : 'تشغيل التداول الآلي',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(String title, String status, Color color) {
    return Card(
      color: const Color(0xFF262626),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 13, color: Colors.white)),
        trailing: Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
      ),
    );
  }
}
