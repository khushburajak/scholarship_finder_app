import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholarshuip_finder_app/app/usecase/usecase.dart';
import 'package:scholarshuip_finder_app/core/error/failure.dart';
import 'package:scholarshuip_finder_app/features/batch/domain/repository/batch_repository.dart';
import 'package:scholarshuip_finder_app/features/batch/domain/entity/batch_entity.dart';

class CreateBatchParams extends Equatable {
  final String batchName;

  const CreateBatchParams({required this.batchName});

  // Empty constructor
  const CreateBatchParams.empty() : batchName = '_empty.string';

  @override
  List<Object?> get props => [batchName];
}

class CreateBatchUseCase implements UsecaseWithParams<void, CreateBatchParams> {
  final IBatchRepository batchRepository;

  CreateBatchUseCase({required this.batchRepository});

  @override
  Future<Either<Failure, void>> call(CreateBatchParams params) async {
    return await batchRepository.createBatch(
      BatchEntity(
        batchName: params.batchName,
      ),
    );
  }
}
