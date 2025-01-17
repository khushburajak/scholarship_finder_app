import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void logout() {}
}
