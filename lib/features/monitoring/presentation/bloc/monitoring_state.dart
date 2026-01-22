part of 'monitoring_bloc.dart';

abstract class MonitoringState extends Equatable {
  const MonitoringState();

  @override
  List<Object> get props => [];
}

class MonitoringInitial extends MonitoringState {}

class MonitoringLoading extends MonitoringState {}

class MonitoringLoaded extends MonitoringState {
  final MonitoringData data;

  const MonitoringLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class MonitoringError extends MonitoringState {
  final String message;

  const MonitoringError({required this.message});

  @override
  List<Object> get props => [message];
}
