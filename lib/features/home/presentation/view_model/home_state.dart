import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view/bottom_view/account_view.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view/bottom_view/scholarship_view.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view/bottom_view/universities_view.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        const Center(child: DashboardView()),
        const Center(child: UniversitiesView()),
        Center(child: ScholarshipView()),
        const Center(child: AccountView()),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
