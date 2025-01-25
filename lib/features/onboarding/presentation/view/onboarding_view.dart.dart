import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarshuip_finder_app/features/onboarding/presentation/view_model/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) =>
                      context.read<OnboardingCubit>().changePage(index),
                  children: const [
                    OnboardingPage(
                      title: "Welcome",
                      description: "Discover scholarships that suit you.",
                      imagePath: "assets/images/mit.jpg",
                    ),
                    OnboardingPage(
                      title: "Search",
                      description: "Search for scholarships effortlessly.",
                      imagePath: "assets/images/sdt1.jpg",
                    ),
                    OnboardingPage(
                      title: "Apply",
                      description: "Easily apply for multiple scholarships.",
                      imagePath: "assets/images/uni1.jpg",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip Button
                    TextButton(
                      onPressed: () {
                        // Navigate to the next screen (e.g., Login/SignUp)
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text("Skip"),
                    ),
                    // Next/Done Button
                    ElevatedButton(
                      onPressed: () {
                        if (state.currentPage == 2) {
                          // If it's the last page, navigate to the next screen
                          Navigator.pushReplacementNamed(context, '/login');
                        } else {
                          // Move to the next page
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(state.currentPage == 2 ? "Done" : "Next"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 250,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 32),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
