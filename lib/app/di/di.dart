import 'package:get_it/get_it.dart';
import 'package:scholarshuip_finder_app/core/network/hive_service.dart';
import 'package:scholarshuip_finder_app/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:scholarshuip_finder_app/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:scholarshuip_finder_app/features/auth/domain/use_case/login_usecase.dart';
import 'package:scholarshuip_finder_app/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:scholarshuip_finder_app/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:scholarshuip_finder_app/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:scholarshuip_finder_app/features/onboarding/presentation/view_model/onboarding_bloc.dart';
import 'package:scholarshuip_finder_app/features/onboarding/presentation/view_model/onboarding_state.dart';
import 'package:scholarshuip_finder_app/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize hive service
  await _initHiveService();

  // Initialize feature-specific dependencies
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initSplashScreenDependencies();
  await _initOnboardingDependencies(); // Add onboarding dependencies
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthLocalRepository>()),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
    ),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthLocalRepository>()),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<OnboardingBloc>()),
  );
}

_initOnboardingDependencies() async {
  getIt.registerFactory<OnboardingBloc>(
    () => OnboardingBloc(
      loginBloc: getIt<LoginBloc>(),
    ),
  );
}
