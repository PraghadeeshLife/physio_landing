import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _isMobile(context) ? DrawerWidget() : null, // Add Drawer for mobile
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroSection(),
                  const SizedBox(height: 64),
                  FeaturesSection(),
                  const SizedBox(height: 64),
                  PricingSection(),
                  const SizedBox(height: 64),
                  AboutSection(),
                  const SizedBox(height: 64),
                  ContactSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600; // Mobile breakpoint
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Show hamburger menu for mobile
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('PhysioTrack', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ],
            ),
          );
        } else {
          // Show full navbar for larger screens
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('PhysioTrack', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    NavBarItem('Features'),
                    NavBarItem('Pricing'),
                    NavBarItem('About'),
                    NavBarItem('Contact'),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('PhysioTrack', style: GoogleFonts.poppins(fontSize: 24, color: Colors.white)),
          ),
          ListTile(
            title: Text('Features', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
              // Add scroll logic or navigation if needed
            },
          ),
          ListTile(
            title: Text('Pricing', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('About', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Contact', style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;

  NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: GoogleFonts.poppins(fontSize: 16)),
    );
  }
}

// The rest of your sections remain unchanged, such as HeroSection, FeaturesSection, PricingSection, etc.


class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Revolutionize Your\nPhysiotherapy Practice',
            style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.width < 600 ? 36 : 48,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: Colors.blue[900]),
          ),
          const SizedBox(height: 24),
          Text(
            'Create personalized exercise plans, track patient progress, and expand your clinic\'s reach with PhysioTrack.',
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[700], height: 1.5),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Join Waiting List', style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {},
                child: Text('Learn More', style: GoogleFonts.poppins()),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue[900]),
        ),
        const SizedBox(height: 32),
        StaggeredGrid.count(
          crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1.3,
              child: _buildFeatureCard(Icons.assignment, 'Customized Exercise Plans', 'Tailored regimens for patients.'),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: _buildFeatureCard(Icons.show_chart, 'Progress Tracking', 'Monitor patient progress.'),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1.2,
              child: _buildFeatureCard(Icons.people, 'Patient Management', 'Manage appointments & records.'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 16),
            Text(title, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

class PricingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Pricing Plans',
          style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue[900]),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 32,
          runSpacing: 32,
          alignment: WrapAlignment.center,
          children: [
            _buildPricingCard('Basic', '\$29/mo', ['Feature 1', 'Feature 2', 'Feature 3']),
            _buildPricingCard('Pro', '\$49/mo', ['Feature 1', 'Feature 2', 'Feature 3', 'Feature 4']),
            _buildPricingCard('Enterprise', '\$99/mo', ['Feature 1', 'Feature 2', 'Feature 3', 'Feature 4', 'Feature 5']),
          ],
        ),
      ],
    );
  }

  Widget _buildPricingCard(String plan, String price, List<String> features) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(plan, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 16),
            Text(price, style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text('• $feature', style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600])),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
            child: Text('Choose Plan', style: GoogleFonts.poppins()),
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ],
    ),
  ),
);}}

class AboutSection extends StatelessWidget { @override Widget build(BuildContext context) { return Container( padding: const EdgeInsets.symmetric(vertical: 64), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( 'About PhysioTrack', style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue[900]), ), const SizedBox(height: 24), Text( 'PhysioTrack is designed to help physiotherapists manage patient care efficiently, allowing for customized exercise plans, easy progress tracking, and patient management.', style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[700], height: 1.5), ), ], ), ); } }

class ContactSection extends StatelessWidget { @override Widget build(BuildContext context) { return Container( padding: const EdgeInsets.symmetric(vertical: 64), color: Colors.blue[50], child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( 'Contact Us', style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue[900]), ), const SizedBox(height: 24), Text( 'Have questions? Reach out to us at support@physiotrack.com or call us at (123) 456-7890.', style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[700], height: 1.5), ), ], ), ); } }