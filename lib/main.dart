import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const RedThreadApp());
}

class RedThreadApp extends StatelessWidget {
  const RedThreadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RedThread',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: HomeScreen.red),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const red = Color(0xFFC51F25);
  static const pinkBg = Color(0xFFFFF5F5);
  static const cardBorder = Color(0xFFF3D6D6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkBg,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _section('Blood Availability', _bloodGrid()),
              _section(
                'Hospital Blood Banks',
                const Column(
                  children: [
                    HospitalCard(
                      'Sample General Hospital',
                      'Marikina City',
                      'Available',
                      Color(0xFFDDF3E4),
                      Color(0xFF1E7B3A),
                    ),
                    SizedBox(height: 10),
                    HospitalCard(
                      'Sample Medical Center',
                      'Quezon City',
                      'Low Stock',
                      Color(0xFFFFEDB8),
                      Color(0xFF8A5A00),
                    ),
                  ],
                ),
                card: false,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RedThreadNavigation(),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      color: red,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.favorite_border, color: Colors.white, size: 22),
              SizedBox(width: 7),
              Text(
                'RedThread',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.notifications_none, color: Colors.white, size: 22),
            ],
          ),
          const SizedBox(height: 10),
          Container(height: 1, color: Colors.white70),
          const SizedBox(height: 10),
          const Text(
            'Hello, Trishia! 👋',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Connecting Lives, One Drop at a Time.',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.volunteer_activism, color: red, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Every Drop Matters',
                      style: TextStyle(
                        color: red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Find blood availability and help patients in need.',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, Widget child, {bool card = true}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 10),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          if (card)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: cardBorder),
              ),
              child: child,
            )
          else
            child,
        ],
      ),
    );
  }

  Widget _bloodGrid() {
    const data = {
      'A+': 12,
      'A-': 3,
      'B+': 8,
      'B-': 0,
      'O+': 10,
      'O-': 2,
      'AB+': 5,
      'AB-': 0,
    };

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        mainAxisExtent: 70,
      ),
      itemBuilder: (context, index) {
        final entry = data.entries.elementAt(index);

        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Container(
                height: 35,
                width: double.infinity,
                color: entry.value >= 5
                    ? const Color(0xFFB5121B)
                    : const Color(0xFFD9666B),
                alignment: Alignment.center,
                child: Text(
                  entry.key,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 35,
                width: double.infinity,
                color: const Color(0xFFFBE4E4),
                alignment: Alignment.center,
                child: Text(
                  '${entry.value} units',
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String city;
  final String status;
  final Color badgeBg;
  final Color badgeFg;

  const HospitalCard(
    this.name,
    this.city,
    this.status,
    this.badgeBg,
    this.badgeFg, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: HomeScreen.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: TextStyle(fontSize: 11, color: badgeFg),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 15,
                color: Colors.black45,
              ),
              const SizedBox(width: 4),
              Text(
                city,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'View Blood Availability',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: HomeScreen.red,
            ),
          ),
        ],
      ),
    );
  }
}

class RedThreadNavigation extends StatelessWidget {
  const RedThreadNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: HomeScreen.cardBorder)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              NavigationItem(Icons.home_outlined, 'Home', true),
              NavigationItem(Icons.water_drop_outlined, 'Blood', false),
              NavigationItem(
                Icons.volunteer_activism_outlined,
                'Requests',
                false,
              ),
              NavigationItem(Icons.person_outline, 'Profile', false),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const NavigationItem(this.icon, this.label, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = selected ? HomeScreen.red : Colors.grey;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 21),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 11, color: color)),
      ],
    );
  }
}
