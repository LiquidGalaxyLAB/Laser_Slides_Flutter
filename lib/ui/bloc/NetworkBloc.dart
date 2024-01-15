import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_event.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_state.dart';
import 'package:laser_slides_flutter/ui/useCase/getNetworkConfig.dart';
import 'package:laser_slides_flutter/ui/useCase/removeNetworkConfig.dart';
import 'package:laser_slides_flutter/ui/useCase/saveNetworkConfig.dart';

class NetworkBloc extends Bloc<NetworkConfigEvent, NetworkConfigState> {
  final GetNetworkConfigUseCase getSavedNetworkConfigUseCase;
  final SaveNetworkConfigUseCase saveNetworkConfigUseCase;
  final RemoveNetworkConfigUseCase removeNetworkConfigUseCase;

  NetworkBloc(
      this.getSavedNetworkConfigUseCase,
      this.saveNetworkConfigUseCase,
      this.removeNetworkConfigUseCase
      )
      : super(NetworkConfigStateLoading()){
      on <GetSavedNetworkConfigEvent> (onGetSavedArticles);
      on <NetworkConfigEventSave> (onSaveNetworkConfig);
      on <NetworkConfigEventDelete> (onRemoveNetworkConfig);
  }
  void onGetSavedArticles(GetSavedNetworkConfigEvent event,Emitter<NetworkConfigState> emit) async {
    final articles = await getSavedNetworkConfigUseCase();
    print("yehailenght ${articles.length}");
    emit(NetworkConfigStateLoaded(articles));
  }

  void onSaveNetworkConfig(NetworkConfigEventSave event,Emitter<NetworkConfigState> emit) async {
    await saveNetworkConfigUseCase(params: event.networkEntity);
    final articles = await getSavedNetworkConfigUseCase();
    emit(NetworkConfigStateLoaded(articles));
  }

  void onRemoveNetworkConfig(NetworkConfigEventDelete event,Emitter<NetworkConfigState> emit) async {
    await removeNetworkConfigUseCase(params: event.networkEntity);
    final articles = await getSavedNetworkConfigUseCase();
    emit(NetworkConfigStateLoaded(articles));
  }




}
