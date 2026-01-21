import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/monitoring_data.dart';

abstract class MonitoringRepository {
  Future<Either<Failure, MonitoringData>> getMonitoringData();
}
