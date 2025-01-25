import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarshuip_finder_app/features/onboarding/presentation/view/onboarding_view.dart.dart';
import 'package:scholarshuip_finder_app/features/onboarding/presentation/view_model/onboarding_cubit.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit(this._onboardingCubit) : super(null);

  final OnboardingCubit _onboardingCubit;

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4), () async {
      // Open Login page or Onboarding Screen

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _onboardingCubit,
              child: OnboardingScreen(),
            ),
          ),
        );
      }
    });
  }
}
