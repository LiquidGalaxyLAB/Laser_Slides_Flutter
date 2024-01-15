import 'package:equatable/equatable.dart';

import '../../../model/local/NetworkSettings.dart';

abstract class NetworkSettingsEvent extends Equatable{
  final NetworkSettings? networkSettings;
  const NetworkSettingsEvent({this.networkSettings});
  @override
  List<Object?> get props => [networkSettings];
}

class GetSavedNetworkSettingsEvent extends NetworkSettingsEvent{
  const GetSavedNetworkSettingsEvent();
}

class NetworkSettingsEventSave extends NetworkSettingsEvent{
  const NetworkSettingsEventSave(NetworkSettings networkSettings) : super(networkSettings: networkSettings);
}

class NetworkSettingsEventDelete extends NetworkSettingsEvent{
  const NetworkSettingsEventDelete(NetworkSettings networkSettings) : super(networkSettings: networkSettings);
}