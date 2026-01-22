class AssetManager {
  static const String _basePath = 'assets';

  static const String brandLogo = '$_basePath/brand-logo.png';
  static const String thermometerIcon17 = '$_basePath/icons/17-thermometer.png';
  static const String thermometerIcon19 = '$_basePath/icons/19-thermometer.png';
  static const String thermometerIcon30 = '$_basePath/icons/30-thermometer.png';

  static const String weatherIconMorning = '$_basePath/icons/morning.png';
  static const String weatherIconSun = '$_basePath/icons/sun.png';
  static const String weatherIconMoon = '$_basePath/icons/mon.png';

  // Deprecated/Aliases for compatibility if needed, using 17/Morning as default
  static const String thermometerIcon = thermometerIcon17;
  static const String weatherIcon = weatherIconMorning;

  // Dashboard Stats Icons
  static const String liveAcPowerIcon = '$_basePath/icons/live-ac-power.png';
  static const String plantGenerationIcon =
      '$_basePath/icons/plant-generation.png';
  static const String livePrIcon = '$_basePath/icons/live-pr.png';
  static const String cumulativePrIcon = '$_basePath/icons/cumulative-pr.png';
  static const String returnPvIcon =
      '$_basePath/icons/return-pv-till-today-.png';
  static const String totalEnergyIcon = '$_basePath/icons/total-energy.png';
  static const String totalNumOfPvModuleIcon =
      '$_basePath/icons/total-num-of-pv-module.png';

  // Capacity Grid Icons
  static const String totalAcCapacityIcon =
      '$_basePath/icons/total-ac-capacity.png';
  static const String totalDcCapacityIcon =
      '$_basePath/icons/total-dc-capacity.png';
  static const String dateOfCommissioningIcon =
      '$_basePath/icons/date-of-commissioning.png';
  static const String numberOfInverterIcon =
      '$_basePath/icons/number-of-inverter.png';

  // Inverter Grid Icons
  static const String lifeEnergyIcon = '$_basePath/icons/life-energy.png';
  static const String livePowerIcon = '$_basePath/icons/live-power.png';
  static const String prevMeterEnergyIcon =
      '$_basePath/icons/prev-meter-energy.png';
  static const String todayEnergyIcon = '$_basePath/icons/today-energy.png';
  static const String inverterPowerHeaderIcon =
      '$_basePath/icons/inverter-power-header-icon.png';
}
