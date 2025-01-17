import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarshuip_finder_app/core/common/snackbar/my_snackbar.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view_model/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout code
              showMySnackBar(
                context: context,
                message: 'Logging out...',
                color: Colors.red,
              );

            },
          ),
          Switch(
            value: _isDarkTheme,
            onChanged: (value) {
              // Change theme
              // setState(() {
              //   _isDarkTheme = value;
              // });
            },
          ),
        ],
      ),
      // body: _views.elementAt(_selectedIndex),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return state.views.elementAt(state.selectedIndex);
      }),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.request_page),
                label: 'scholarships',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Universities',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
            currentIndex: state.selectedIndex,
            selectedItemColor: Colors.white,
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
          );
        },
      ),
    );
  }
}
