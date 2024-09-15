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

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

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
        actions: [
          if (MediaQuery.of(context).size.width > 600) ...[
            TextButton(onPressed: () {}, child: const Text('Features')),
            TextButton(onPressed: () {}, child: const Text('Pricing')),
            TextButton(onPressed: () {}, child: const Text('About')),
            TextButton(onPressed: () {}, child: const Text('Contact')),
          ]
        ],
      ),
      drawer: MediaQuery.of(context).size.width <= 600 ? _buildDrawer(context) : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeroSection(),
              SizedBox(height: 64),
              FeaturesSection(),
              SizedBox(height: 64),
              AboutSection(),
              SizedBox(height: 64),
              ContactSection(),
            ],
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.black),
                const SizedBox(width: 8),
                const Text('PhysioTrack', style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
          ListTile(
            title: const Text('Features', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Pricing', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Contact', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

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
          'Create personalized exercise plans, track patient progress, and expand your clinic\'s reach with PhysioTrack - the all-in-one solution for modern physiotherapists.',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildFeatureCard(Icons.assignment, 'Customized Exercise Plans', 'Create tailored exercise regimens for each patient, including video instructions and progress tracking.')),
                  const SizedBox(width: 32),
                  Expanded(child: _buildFeatureCard(Icons.show_chart, 'Progress Tracking', 'Monitor patient progress over time, visualize improvements, and adjust plans as needed.')),
                  const SizedBox(width: 32),
                  Expanded(child: _buildFeatureCard(Icons.people, 'Patient Management', 'Efficiently manage your patient roster, appointments, and treatment history in one place.')),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildFeatureCard(Icons.assignment, 'Customized Exercise Plans', 'Create tailored exercise regimens for each patient, including video instructions and progress tracking.'),
                  const SizedBox(height: 32),
                  _buildFeatureCard(Icons.show_chart, 'Progress Tracking', 'Monitor patient progress over time, visualize improvements, and adjust plans as needed.'),
                  const SizedBox(height: 32),
                  _buildFeatureCard(Icons.people, 'Patient Management', 'Efficiently manage your patient roster, appointments, and treatment history in one place.'),
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
      elevation: 0,
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

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About PhysioTrack',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'PhysioTrack is a cutting-edge platform designed to empower physiotherapists and enhance patient care. Our mission is to bridge the gap between in-clinic treatments and at-home exercises, ensuring better outcomes for patients and more efficient practice management for therapists.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Founded by a team of experienced physiotherapists and software engineers, PhysioTrack combines clinical expertise with advanced technology to create a solution that truly understands and addresses the needs of modern physiotherapy practices.',
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
        const SizedBox(height: 16),
        Text(
          'Have questions or want to learn more? Get in touch with our team.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                children: [
                  Expanded(child: _buildContactForm()),
                  const SizedBox(width: 32),
                  Expanded(child: _buildContactInfo(context)),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildContactForm(),
                  const SizedBox(height: 32),
                  _buildContactInfo(context),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Message',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            backgroundColor: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email: info@physiotrack.com', style: Theme.of(context).textTheme.bodyLarge), 
        const SizedBox(height: 16),
        Text('Phone: +1 (123) 456-7890', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text('Address: 1234 Physio St., Wellness City, WC 56789', style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
