import 'package:flutter/material.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view/detail_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholarship Finder'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              const _UserProfile(),

              const SizedBox(height: 20),

              // Best Universities Section
              const _SectionTitle(title: 'Best Universities'),
              const SizedBox(height: 10),
              const _BestUniversitiesList(),

              const SizedBox(height: 20),

              // Popular Scholarships Section
              const _SectionTitle(title: 'Popular Scholarships'),
              const SizedBox(height: 10),
              const _PopularScholarshipsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserProfile extends StatelessWidget {
  const _UserProfile();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/profile.png')),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome, Khushbu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Explore new opportunities!',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _BestUniversitiesList extends StatelessWidget {
  const _BestUniversitiesList();

  @override
  Widget build(BuildContext context) {
    final universities = [
      {'name': 'Harvard University', 'image': 'assets/images/uni1.jpg'},
      {'name': 'MIT', 'image': 'assets/images/mit.jpg'},
      {'name': 'Stanford University', 'image': 'assets/images/mit.jpg'},
    ];

    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: universities.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final university = universities[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(
                    title: university['name']!,
                    description: 'Details about ${university['name']}',
                    imageUrl: university['image']!,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    university['image']!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(university['name']!),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PopularScholarshipsList extends StatelessWidget {
  const _PopularScholarshipsList();

  @override
  Widget build(BuildContext context) {
    final scholarships = [
      {
        'title': 'Fulbright Scholarship',
        'description': 'For international students',
        'image': 'assets/images/mit.jpg',
      },
      {
        'title': 'Chevening Scholarship',
        'description': 'UK government scholarship',
        'image': 'assets/images/uni1.jpg',
      },
      {
        'title': 'Erasmus Mundus',
        'description': 'For European countries',
        'image': 'assets/images/mit.jpg',
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: scholarships.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final scholarship = scholarships[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(
                  title: scholarship['title']!,
                  description: scholarship['description']!,
                  imageUrl: scholarship['image']!,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    scholarship['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        scholarship['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        scholarship['description']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
