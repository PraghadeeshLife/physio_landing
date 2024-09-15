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
            Icon(Icons.favorite, color: Colors.black),
            SizedBox(width: 8),
            Text('PhysioTrack', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text('Features')),
          TextButton(onPressed: () {}, child: Text('Pricing')),
          TextButton(onPressed: () {}, child: Text('About')),
          TextButton(onPressed: () {}, child: Text('Contact')),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        SizedBox(height: 16),
        Text(
          'Create personalized exercise plans, track patient progress, and expand your clinic\'s reach with PhysioTrack - the all-in-one solution for modern physiotherapists.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 32),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Join Waiting List'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
            SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              child: Text('Learn More'),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
          ],
        ),
      ],
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
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildFeatureCard(Icons.assignment, 'Customized Exercise Plans', 'Create tailored exercise regimens for each patient, including video instructions and progress tracking.')),
                  SizedBox(width: 32),
                  Expanded(child: _buildFeatureCard(Icons.show_chart, 'Progress Tracking', 'Monitor patient progress over time, visualize improvements, and adjust plans as needed.')),
                  SizedBox(width: 32),
                  Expanded(child: _buildFeatureCard(Icons.people, 'Patient Management', 'Efficiently manage your patient roster, appointments, and treatment history in one place.')),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildFeatureCard(Icons.assignment, 'Customized Exercise Plans', 'Create tailored exercise regimens for each patient, including video instructions and progress tracking.'),
                  SizedBox(height: 32),
                  _buildFeatureCard(Icons.show_chart, 'Progress Tracking', 'Monitor patient progress over time, visualize improvements, and adjust plans as needed.'),
                  SizedBox(height: 32),
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
            SizedBox(height: 16),
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About PhysioTrack',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 16),
        Text(
          'PhysioTrack is a cutting-edge platform designed to empower physiotherapists and enhance patient care. Our mission is to bridge the gap between in-clinic treatments and at-home exercises, ensuring better outcomes for patients and more efficient practice management for therapists.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 16),
        Text(
          'Founded by a team of experienced physiotherapists and software engineers, PhysioTrack combines clinical expertise with advanced technology to create a solution that truly understands and addresses the needs of modern physiotherapy practices.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 16),
        Text(
          'Have questions or want to learn more? Get in touch with our team.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildContactInfo(Icons.email, 'Email', 'info@physiotrack.com')),
                  SizedBox(width: 32),
                  Expanded(child: _buildContactInfo(Icons.phone, 'Phone', '+1 (555) 123-4567')),
                  SizedBox(width: 32),
                  Expanded(child: _buildContactInfo(Icons.location_on, 'Address', '123 Physio St, Health City, MC 12345')),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildContactInfo(Icons.email, 'Email', 'info@physiotrack.com'),
                  SizedBox(height: 16),
                  _buildContactInfo(Icons.phone, 'Phone', '+1 (555) 123-4567'),
                  SizedBox(height: 16),
                  _buildContactInfo(Icons.location_on, 'Address', '123 Physio St, Health City, MC 12345'),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String title, String info) {
    return Row(
      children: [
        Icon(icon, size: 24),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(info, style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}