import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Onboarding State
class OnboardingState extends Equatable {
  final int currentPage;

  const OnboardingState({required this.currentPage});

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(currentPage: currentPage ?? this.currentPage);
  }

  @override
  List<Object?> get props => [currentPage];
}
  
// Onboarding Cubit
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(currentPage: 0));

  // Update the current page
  void changePage(int index) {
    emit(state.copyWith(currentPage: index));
  }

  // navigate to login view after clicking on the skip button or the last page
  void navigateToLogin() {
    emit(state.copyWith(currentPage: 2));
  }
}
