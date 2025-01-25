import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarshuip_finder_app/features/auth/presentation/view_model/login/login_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Welcome Section
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Welcome, John Doe',
                        style: Theme.of(context).textTheme.bodyLarge),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        // Navigate to settings
                      },
                    ),
                  ],
                ),
              ),
              // Featured Scholarships Carousel
              SizedBox(
                height: 250, // Increased the height for better visuals
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _featuredCard(
                        'Global Excellence Scholarship',
                        'A fully-funded scholarship for international students.',
                        'assets/images/mit.jpg'),
                    _featuredCard(
                        'Science and Tech Scholarship',
                        'Scholarships for students pursuing degrees in science and technology.',
                        'assets/images/sdt1.jpg'),
                    _featuredCard(
                        'Women in Engineering Scholarship',
                        'A scholarship designed to encourage women to pursue engineering careers.',
                        'assets/images/uni1.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Quick Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickActionButton(context, 'Search', Icons.search),
                  _quickActionButton(context, 'Applied ', Icons.check_circle),
                  _quickActionButton(context, 'Saved ', Icons.favorite),
                ],
              ),
              const SizedBox(height: 20),
              // Notifications Section
              Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.notifications_active),
                  title: Text('New Scholarship Opportunity'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigate to scholarship details
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Most Popular Scholarships Grid
              Text(
                'Most Popular Scholarships',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4, // Number of items
                itemBuilder: (context, index) {
                  return _popularScholarshipCard(
                    'Tech Innovators Scholarship',
                    '2500 students applied',
                    'assets/images/mit.jpg',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featuredCard(String title, String description, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 5,
        child: SizedBox(
          width: 180, // Adjusted width to fit the content better
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _quickActionButton(BuildContext context, String title, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        // Navigate to relevant page
      },
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _popularScholarshipCard(String title, String stats, String imagePath) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              stats,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
