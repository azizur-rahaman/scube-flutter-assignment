import 'package:equatable/equatable.dart';

class MonitoringData extends Equatable {
  final String currentPower;
  final String plantGeneration;
  final String livePr;
  final String cumulativePr;
  final String returnPv;
  final String totalEnergy;
  final WeatherInfo weather;
  final ComparisonData comparison;
  final SystemInfo systemInfo;
  final List<Inverter> inverters;

  const MonitoringData({
    required this.currentPower,
    required this.plantGeneration,
    required this.livePr,
    required this.cumulativePr,
    required this.returnPv,
    required this.totalEnergy,
    required this.weather,
    required this.comparison,
    required this.systemInfo,
    required this.inverters,
  });

  @override
  List<Object> get props => [
    currentPower,
    plantGeneration,
    livePr,
    cumulativePr,
    returnPv,
    totalEnergy,
    weather,
    comparison,
    systemInfo,
    inverters,
  ];
}

class WeatherInfo extends Equatable {
  final String temperature;
  final String windSpeed;
  final String irradiation;
  final String condition;

  const WeatherInfo({
    required this.temperature,
    required this.windSpeed,
    required this.irradiation,
    required this.condition,
  });

  @override
  List<Object> get props => [temperature, windSpeed, irradiation, condition];
}

class ComparisonData extends Equatable {
  final DailyStats yesterday;
  final DailyStats today;

  const ComparisonData({required this.yesterday, required this.today});

  @override
  List<Object> get props => [yesterday, today];
}

class DailyStats extends Equatable {
  final String acMaxPower;
  final String netEnergy;
  final String specificYield;

  const DailyStats({
    required this.acMaxPower,
    required this.netEnergy,
    required this.specificYield,
  });

  @override
  List<Object> get props => [acMaxPower, netEnergy, specificYield];
}

class SystemInfo extends Equatable {
  final String pvModules;
  final String totalAcCapacity;
  final String totalDcCapacity;
  final String commissioningDate;
  final String inverterCount;

  const SystemInfo({
    required this.pvModules,
    required this.totalAcCapacity,
    required this.totalDcCapacity,
    required this.commissioningDate,
    required this.inverterCount,
  });

  @override
  List<Object> get props => [
    pvModules,
    totalAcCapacity,
    totalDcCapacity,
    commissioningDate,
    inverterCount,
  ];
}

class Inverter extends Equatable {
  final String id;
  final String currentPower;
  final String lifetimeEnergy;
  final String todayEnergy;
  final String prevMeterEnergy;
  final String livePower;

  const Inverter({
    required this.id,
    required this.currentPower,
    required this.lifetimeEnergy,
    required this.todayEnergy,
    required this.prevMeterEnergy,
    required this.livePower,
  });

  @override
  List<Object> get props => [
    id,
    currentPower,
    lifetimeEnergy,
    todayEnergy,
    prevMeterEnergy,
    livePower,
  ];
}
