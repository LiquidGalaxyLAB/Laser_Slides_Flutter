import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laser_slides_flutter/ui/bloc/osc/OscEvent.dart';
import 'package:laser_slides_flutter/ui/bloc/osc/OscState.dart';
import 'package:osc/osc.dart';

class OSCSenderBloc extends Bloc<OscEvent, OscSenderState> {
  OSCSenderBloc() : super(const OscSenderStateLoading());

  Stream<OscSenderState> mapEventToState(OscEvent event) async* {
    if (event is SendOscEvent) {
      yield* _mapSendOSCEventToState(event);
    }
  }

  Stream<OscSenderState> _mapSendOSCEventToState(SendOscEvent event) async* {

    try {
      // Your OSC sending logic here

      if (event.args.length < 3) {
        print("Error");
        yield OscSenderStateError('Insufficient arguments');
        return;
      }

      final destination = InternetAddress(event.args[0]);
      final port = int.tryParse(event.args[1]);

      if (destination == null || port == null) {

        yield OscSenderStateError('Invalid destination or port');
        return;
      }

      print("Ip $destination");
      print("Port $port");

      final address = event.args[2];

      final arguments = <Object>[];
      for (var i = 3; i < event.args.length; i += 2) {
        arguments.add(DataCodec.forType(event.args[i]).toValue(event.args[i + 1]));
      }

      final message = OSCMessage(address, arguments: arguments);
      print("Message ${message.arguments}");
      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      print('Sending from ${socket.address.address}:${socket.port}...');

      final bytes = message.toBytes();
      socket.send(bytes, destination, port);
      yield const OscSenderStateLoaded();
    } catch (e) {
      print('Error: $e');
      yield OscSenderStateError('Error: $e');
    }
  }
}
