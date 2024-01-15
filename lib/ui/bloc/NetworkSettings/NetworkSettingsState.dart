import 'package:equatable/equatable.dart';

import '../../../model/local/NetworkSettings.dart';

abstract class NetworkSettingsState extends Equatable{
  final List<NetworkSettings> networkSettings;
  const NetworkSettingsState({this.networkSettings = const []});
  @override
  List<Object?> get props => [networkSettings];
}

class NetworkSettingsStateLoading extends NetworkSettingsState{
  const NetworkSettingsStateLoading();
}

class NetworkSettingsStateLoaded extends NetworkSettingsState{
  const NetworkSettingsStateLoaded(List<NetworkSettings> networkSettings) : super(networkSettings: networkSettings);
}