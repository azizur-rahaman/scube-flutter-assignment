import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/monitoring_data.dart';
import '../../domain/usecases/get_monitoring_data.dart';

part 'monitoring_event.dart';
part 'monitoring_state.dart';

class MonitoringBloc extends Bloc<MonitoringEvent, MonitoringState> {
  final GetMonitoringData getMonitoringData;

  MonitoringBloc({required this.getMonitoringData})
    : super(MonitoringInitial()) {
    on<LoadMonitoringData>(_onLoadMonitoringData);
  }

  Future<void> _onLoadMonitoringData(
    LoadMonitoringData event,
    Emitter<MonitoringState> emit,
  ) async {
    emit(MonitoringLoading());
    final result = await getMonitoringData();
    result.fold(
      (failure) =>
          emit(MonitoringError(message: _mapFailureToMessage(failure))),
      (data) => emit(MonitoringLoaded(data: data)),
    );
  }

  String _mapFailureToMessage(failure) {
    // You can map different failures to different messages here
    return 'Unexpected Error';
  }
}
