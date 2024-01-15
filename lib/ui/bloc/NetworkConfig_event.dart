import 'package:equatable/equatable.dart';
import 'package:laser_slides_flutter/model/local/NetworkEntity.dart';


abstract class NetworkConfigEvent extends Equatable{
  final NetworkEntity? networkEntity;
  const NetworkConfigEvent({this.networkEntity});
  @override
  List<Object?> get props => [networkEntity];
}



class GetSavedNetworkConfigEvent extends NetworkConfigEvent{
  const GetSavedNetworkConfigEvent();
}

class NetworkConfigEventSave extends NetworkConfigEvent{
  const NetworkConfigEventSave(NetworkEntity networkEntity) : super(networkEntity: networkEntity);
}

class NetworkConfigEventDelete extends NetworkConfigEvent{
  const NetworkConfigEventDelete(NetworkEntity networkEntity) : super(networkEntity: networkEntity);
}

class NetworkConfigEventUpdate extends NetworkConfigEvent{
  const NetworkConfigEventUpdate(NetworkEntity networkEntity) : super(networkEntity: networkEntity);
}

class NetworkConfigEventInsert extends NetworkConfigEvent{
  const NetworkConfigEventInsert(NetworkEntity networkEntity) : super(networkEntity: networkEntity);
}

class NetworkConfigEventClear extends NetworkConfigEvent{
  const NetworkConfigEventClear();
}
