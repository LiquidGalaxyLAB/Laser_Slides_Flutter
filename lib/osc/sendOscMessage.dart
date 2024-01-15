import 'dart:io';

import 'package:ansicolor/ansicolor.dart';
import 'package:osc/src/convert.dart';
import 'package:osc/src/message.dart';

class OSCSender {
  void sendOSC(List<String> args) {
    if (args.length < 5 && (args.length & 1 == 0)) {
      printUsage();
      exit(15);
    }

    final destination = InternetAddress(args[0]);
    final port = int.parse(args[1]);

    final address = args[2];

    final arguments = <Object>[];
    for (var i = 3; i < args.length; i += 2) {
      final type = args[i];
      final value = args[i + 1];

      switch (type) {
        case 'int':
          arguments.add(int.parse(value));
          break;
        case 'float':
          arguments.add(double.parse(value));
          break;
      // Add more cases for other types as needed

        default:
        // Handle unsupported types or show an error
          print('Unsupported type: $type');
          exit(1);
      }
    }

    final message = OSCMessage(address, arguments: arguments);

    RawDatagramSocket.bind(InternetAddress.anyIPv4, 0).then((socket) {
      final greenPen = AnsiPen()..green(bold: true);
      final yellowPen = AnsiPen()..yellow();

      print(
          yellowPen('Sending from ${socket.address.address}:${socket.port}...'));

      final bytes = message.toBytes();
      socket.send(bytes, destination, port);
      print(greenPen('$bytes'));
    });
  }

  void printUsage() {
    print('Usage : sendosc host port path [[type] [param]] ...');
  }
}


