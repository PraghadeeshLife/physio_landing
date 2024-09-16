import 'package:flutter/material.dart';

void main() {
  runApp(const PhysioTrackApp());
}

class PhysioTrackApp extends StatelessWidget {
  const PhysioTrackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhysioTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black),
          displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _pricingKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext!;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.favorite, color: Colors.black),
            const SizedBox(width: 8),
            const Text('PhysioTrack', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: _buildAppBarActions(context),
      ),
      drawer: _buildDrawerMenu(context),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroSection(),
              const SizedBox(height: 64),
              FeaturesSection(key: _featuresKey),
              const SizedBox(height: 64),
              PricingSection(key: _pricingKey),
              const SizedBox(height: 64),
              AboutSection(key: _aboutKey),
              const SizedBox(height: 64),
              ContactSection(key: _contactKey),
            ],
          ),
        ),
      ),
    );
  }

  /// Determines if the screen is large or small
  bool _isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  /// Builds the navigation bar actions based on screen size
  List<Widget> _buildAppBarActions(BuildContext context) {
    if (_isLargeScreen(context)) {
      return [
        TextButton(
          onPressed: () => _scrollToSection(_featuresKey),
          child: const Text('Features'),
        ),
        TextButton(
          onPressed: () => _scrollToSection(_pricingKey),
          child: const Text('Pricing'),
        ),
        TextButton(
          onPressed: () => _scrollToSection(_aboutKey),
          child: const Text('About'),
        ),
        TextButton(
          onPressed: () => _scrollToSection(_contactKey),
          child: const Text('Contact'),
        ),
      ];
    } else {
      return [
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ];
    }
  }

  /// Drawer for smaller screens (hamburger menu)
  Drawer _buildDrawerMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text('PhysioTrack', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: const Text('Features'),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_featuresKey);
            },
          ),
          ListTile(
            title: const Text('Pricing'),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_pricingKey);
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_aboutKey);
            },
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_contactKey);
            },
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Revolutionize Your Physiotherapy Practice',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Create personalized exercise plans, track patient progress, and expand your clinic\'s reach with PhysioTrack.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Join Waiting List'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Learn More'),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                children: [
                  Expanded(child: _buildFeatureCard(Icons.assignment, 'Customized Exercise Plans', 'Create tailored exercise regimens for each patient.')),
                  const SizedBox(width: 32),
                  Expanded(child: _buildFeatureCard(Icons.show_chart, 'Progress Tracking', 'Monitor patient progress over time.')),
                  const SizedBox(width: 32),
                  Expanded(child: _buildFeatureCard(Icons.people, 'Patient Management', 'Efficiently manage your patient roster.')),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildFeatureCard(Icons.assignment, 'Customized Exercise Plans', 'Create tailored exercise regimens for each patient.'),
                  const SizedBox(height: 32),
                  _buildFeatureCard(Icons.show_chart, 'Progress Tracking', 'Monitor patient progress over time.'),
                  const SizedBox(height: 32),
                  _buildFeatureCard(Icons.people, 'Patient Management', 'Efficiently manage your patient roster.'),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class PricingSection extends StatelessWidget {
  const PricingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pricing Plans',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                children: [
                  Expanded(child: _buildPricingCard('Free', '\$0/mo', 'Basic features to get started')),
                  const SizedBox(width: 32),
                  Expanded(child: _buildPricingCard('Pro', '\$49/mo', 'Advanced features for growing clinics')),
                  const SizedBox(width: 32),
                  Expanded(child: _buildPricingCard('Enterprise', 'Custom', 'Tailored solutions for large organizations')),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildPricingCard('Free', '\$0/mo', 'Basic features to get started'),
                  const SizedBox(height: 32),
                  _buildPricingCard('Pro', '\$49/mo', 'Advanced features for growing clinics'),
                  const SizedBox(height: 32),
                  _buildPricingCard('Enterprise', 'Custom', 'Tailored solutions for large organizations'),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildPricingCard(String title, String price, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(price, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 16),
            Text(description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Us',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 32),
        Text(
          'PhysioTrack is revolutionizing physiotherapy by providing tools for personalized patient care and progress tracking.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 32),
        Text('Email: info@physiotrack.com', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text('Phone: +1 (123) 456-7890', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text('Address: 1234 Physio St., Wellness City, WC 56789', style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
