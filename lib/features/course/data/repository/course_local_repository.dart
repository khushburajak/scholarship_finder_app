import 'package:dartz/dartz.dart';
import 'package:scholarshuip_finder_app/core/error/failure.dart';
import 'package:scholarshuip_finder_app/features/course/data/data_source/course_local_data_source.dart';
import 'package:scholarshuip_finder_app/features/course/domain/entity/course_entity.dart';
import 'package:scholarshuip_finder_app/features/course/domain/repository/course_repository.dart';

class CourseLocalRepository implements ICourseRepository {
  final CourseLocalDataSource _courseLocalDataSource;

  CourseLocalRepository({required CourseLocalDataSource courseLocalDataSource})
      : _courseLocalDataSource = courseLocalDataSource;

  @override
  Future<Either<Failure, void>> createCourse(CourseEntity course) {
    try {
      _courseLocalDataSource.createCourse(course);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String id) {
    try {
      _courseLocalDataSource.deleteCourse(id);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourses() {
    try {
      return _courseLocalDataSource.getCourses().then(
        (value) {
          return Right(value);
        },
      );
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }
}
