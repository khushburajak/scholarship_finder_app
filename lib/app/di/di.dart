import 'package:get_it/get_it.dart';
import 'package:scholarshuip_finder_app/core/network/hive_service.dart';
import 'package:scholarshuip_finder_app/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:scholarshuip_finder_app/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:scholarshuip_finder_app/features/auth/domain/use_case/login_usecase.dart';
import 'package:scholarshuip_finder_app/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:scholarshuip_finder_app/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:scholarshuip_finder_app/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:scholarshuip_finder_app/features/batch/data/data_source/batch_local_data_source.dart';
import 'package:scholarshuip_finder_app/features/batch/data/repository/batch_local_repository.dart';
import 'package:scholarshuip_finder_app/features/batch/domain/use_case/create_batch_usecase.dart';
import 'package:scholarshuip_finder_app/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:scholarshuip_finder_app/features/batch/domain/use_case/get_all_batch_usecase.dart';
import 'package:scholarshuip_finder_app/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:scholarshuip_finder_app/features/course/data/data_source/course_local_data_source.dart';
import 'package:scholarshuip_finder_app/features/course/data/repository/course_local_repository.dart';
import 'package:scholarshuip_finder_app/features/course/domain/use_case/create_course_usecase.dart';
import 'package:scholarshuip_finder_app/features/course/domain/use_case/delete_course_usecase.dart';
import 'package:scholarshuip_finder_app/features/course/domain/use_case/get_all_course_usecase.dart';
import 'package:scholarshuip_finder_app/features/course/presentation/view_model/course_bloc.dart';
import 'package:scholarshuip_finder_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:scholarshuip_finder_app/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:scholarshuip_finder_app/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Initialize hive service
  await _initHiveService();

  // Initialize feature-specific dependencies
  await _initBatchDependencies();
  await _initCourseDependencies();
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
      batchBloc: getIt<BatchBloc>(),
      courseBloc: getIt<CourseBloc>(),
      registerUseCase: getIt(),
    ),
  );
}

_initCourseDependencies() {
  getIt.registerFactory<CourseLocalDataSource>(
    () => CourseLocalDataSource(hiveService: getIt<HiveService>()),
  );

  getIt.registerLazySingleton<CourseLocalRepository>(
    () => CourseLocalRepository(
        courseLocalDataSource: getIt<CourseLocalDataSource>()),
  );

  getIt.registerLazySingleton<CreateCourseUsecase>(
    () => CreateCourseUsecase(
      courseRepository: getIt<CourseLocalRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetAllCourseUsecase>(
    () => GetAllCourseUsecase(
      courseRepository: getIt<CourseLocalRepository>(),
    ),
  );

  getIt.registerLazySingleton<DeleteCourseUsecase>(
    () => DeleteCourseUsecase(
      courseRepository: getIt<CourseLocalRepository>(),
    ),
  );

  getIt.registerFactory<CourseBloc>(
    () => CourseBloc(
      getAllCourseUsecase: getIt<GetAllCourseUsecase>(),
      createCourseUsecase: getIt<CreateCourseUsecase>(),
      deleteCourseUsecase: getIt<DeleteCourseUsecase>(),
    ),
  );
}

_initBatchDependencies() async {
  getIt.registerFactory<BatchLocalDataSource>(
    () => BatchLocalDataSource(hiveService: getIt<HiveService>()),
  );

  getIt.registerLazySingleton<BatchLocalRepository>(
    () => BatchLocalRepository(
        batchLocalDataSource: getIt<BatchLocalDataSource>()),
  );

  getIt.registerLazySingleton<CreateBatchUseCase>(
    () => CreateBatchUseCase(batchRepository: getIt<BatchLocalRepository>()),
  );

  getIt.registerLazySingleton<GetAllBatchUseCase>(
    () => GetAllBatchUseCase(batchRepository: getIt<BatchLocalRepository>()),
  );

  getIt.registerLazySingleton<DeleteBatchUsecase>(
    () => DeleteBatchUsecase(batchRepository: getIt<BatchLocalRepository>()),
  );

  getIt.registerFactory<BatchBloc>(
    () => BatchBloc(
      createBatchUseCase: getIt<CreateBatchUseCase>(),
      getAllBatchUseCase: getIt<GetAllBatchUseCase>(),
      deleteBatchUsecase: getIt<DeleteBatchUsecase>(),
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
    () => SplashCubit(getIt<OnboardingCubit>()),
  );
}

_initOnboardingDependencies() async {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(),
  );
}
