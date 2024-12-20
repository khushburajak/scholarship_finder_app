import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00c6ff), Color(0xFF0072ff)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Text(
                    "Welcome to Scholarship Finder",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Find scholarships tailored for you",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search Scholarships",
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.search, color: Colors.white),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Dashboard Sections
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildDashboardCard(
                            context,
                            title: "Available Scholarships",
                            description: "Browse and apply for the latest scholarships.",
                            icon: Icons.school,
                            onTap: () {
                              // Navigate to Available Scholarships Screen
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildDashboardCard(
                            context,
                            title: "Bookmarked Scholarships",
                            description: "Your saved scholarships for quick access.",
                            icon: Icons.bookmark,
                            onTap: () {
                              // Navigate to Bookmarked Scholarships Screen
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildDashboardCard(
                            context,
                            title: "Application Status",
                            description: "Track your submitted applications.",
                            icon: Icons.assignment_turned_in,
                            onTap: () {
                              // Navigate to Application Status Screen
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildDashboardCard(
                            context,
                            title: "Profile",
                            description: "View or edit your profile information.",
                            icon: Icons.person,
                            onTap: () {
                              // Navigate to Profile Screen
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required String title,
      required String description,
      required IconData icon,
      required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 30, color: Colors.blueAccent),
            ),
            const SizedBox(width: 16),
            // Text Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
