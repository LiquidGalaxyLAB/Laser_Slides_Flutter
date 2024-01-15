import 'package:equatable/equatable.dart';
import 'package:laser_slides_flutter/model/local/NetworkEntity.dart';

abstract class NetworkConfigState extends Equatable{
  final List<NetworkEntity> networkEntities;
  const NetworkConfigState({this.networkEntities = const []});
  @override
  List<Object?> get props => [networkEntities];

}

class NetworkConfigStateLoading extends NetworkConfigState{
  const NetworkConfigStateLoading();
}

class NetworkConfigStateLoaded extends NetworkConfigState{
  const NetworkConfigStateLoaded(List<NetworkEntity> networkEntities) : super(networkEntities: networkEntities);
}

class NetworkConfigStateError extends NetworkConfigState{
  final String message;
  const NetworkConfigStateError(this.message);
}