import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laser_slides_flutter/ui/useCase/NetworkSettings/getNtwkStngs.dart';
import 'package:laser_slides_flutter/ui/useCase/NetworkSettings/removeNtwrkStngs.dart';
import 'package:laser_slides_flutter/ui/useCase/NetworkSettings/saveNtwrkStngs.dart';

import '../../../domain/repositories/NetworkSettings/NtwrkRepository.dart';
import 'NetworkSettingsEvent.dart';
import 'NetworkSettingsState.dart';

class NetworkSettingsBloc extends Bloc<NetworkSettingsEvent, NetworkSettingsState> {
  final GetNetworkSettingsUseCase getNetworkSettingsUseCase;
  final SaveNetworkSettingsUseCase saveNetworkSettingsUseCase;
  final RemoveNetworkSettingsUseCase removeNetworkSettingsUseCase;

  NetworkSettingsBloc(this.getNetworkSettingsUseCase,
      this.saveNetworkSettingsUseCase,
      this.removeNetworkSettingsUseCase)
      : super(NetworkSettingsStateLoading()) {
    on <GetSavedNetworkSettingsEvent>(onGetNetworkSettings);
    on <NetworkSettingsEventSave>(onSaveNetworkSettings);
    on <NetworkSettingsEventDelete>(onRemoveNetworkSettings);
  }

  void onGetNetworkSettings(GetSavedNetworkSettingsEvent event, Emitter<NetworkSettingsState> emit) async {
    final networkSettings = await getNetworkSettingsUseCase();
    emit(NetworkSettingsStateLoaded(networkSettings));
  }

  void onSaveNetworkSettings(NetworkSettingsEventSave event, Emitter<NetworkSettingsState> emit) async {
    await saveNetworkSettingsUseCase(params: event.networkSettings);
    final networkSettings = await getNetworkSettingsUseCase();
    emit(NetworkSettingsStateLoaded(networkSettings));
  }

  void onRemoveNetworkSettings(NetworkSettingsEventDelete event, Emitter<NetworkSettingsState> emit) async {
    await removeNetworkSettingsUseCase(params: event.networkSettings);
    final networkSettings = await getNetworkSettingsUseCase();
    emit(NetworkSettingsStateLoaded(networkSettings));
  }


}
