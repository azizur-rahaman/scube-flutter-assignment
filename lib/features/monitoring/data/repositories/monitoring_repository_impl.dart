import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/monitoring_data.dart';
import '../../domain/repositories/monitoring_repository.dart';
import '../datasources/monitoring_local_data_source.dart';

class MonitoringRepositoryImpl implements MonitoringRepository {
  final MonitoringLocalDataSource localDataSource;

  MonitoringRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, MonitoringData>> getMonitoringData() async {
    try {
      final localData = await localDataSource.getMonitoringData();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
