import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/monitoring_data.dart';
import '../repositories/monitoring_repository.dart';

class GetMonitoringData {
  final MonitoringRepository repository;

  GetMonitoringData(this.repository);

  Future<Either<Failure, MonitoringData>> call() async {
    return await repository.getMonitoringData();
  }
}
