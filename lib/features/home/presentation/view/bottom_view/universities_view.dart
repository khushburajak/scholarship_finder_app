import 'package:flutter/material.dart';

class UniversitiesView extends StatelessWidget {
  const UniversitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Universities',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 16),
              _buildUniversityGrid(popularUniversities),
              SizedBox(height: 30),
              Text(
                'All Universities',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 16),
              _buildUniversityGrid(allUniversities),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUniversityGrid(List<University> universities) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75, // Adjusted for more rectangular cards
      ),
      itemCount: universities.length,
      itemBuilder: (context, index) {
        return _buildUniversityCard(universities[index]);
      },
    );
  }

  Widget _buildUniversityCard(University university) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/${university.name.toLowerCase().replaceAll(" ", "_")}.jpg', // Dynamic path for images
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            // Content Overlay
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    university.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    university.location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ranking: ${university.ranking}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class University {
  final String name;
  final String location;
  final int ranking;

  University({
    required this.name,
    required this.location,
    required this.ranking,
  });
}

final List<University> popularUniversities = [
  University(name: 'sdt1', location: 'Cambridge, MA', ranking: 1),
  University(name: 'sdt1', location: 'Stanford, CA', ranking: 2),
  // Add more popular universities here
];

final List<University> allUniversities = [
  University(name: 'uni1', location: 'Cambridge, MA', ranking: 1),
  University(name: 'uni1', location: 'Stanford, CA', ranking: 2),
  University(name: 'MIT', location: 'Cambridge, MA', ranking: 3),
  // Add more universities here
];
