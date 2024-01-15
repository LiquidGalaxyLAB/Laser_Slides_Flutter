import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laser_slides_flutter/model/local/NetworkSettings.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsBloc.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsEvent.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsState.dart';
import 'package:laser_slides_flutter/ui/home/EditButtonConfig.dart';
import 'package:laser_slides_flutter/ui/home/Home.dart';
import 'package:laser_slides_flutter/ui/widgets/RounButtonAnim.dart';

import '../../colors/Colors.dart';
import '../../injectionContainer.dart';

class ConnectToNetwork extends StatefulWidget {
  const ConnectToNetwork({Key? key}) : super(key: key);

  static const String routeName = '/connectToNetwork';

  @override
  State<ConnectToNetwork> createState() => _ConnectToNetworkState();
}

class _ConnectToNetworkState extends State<ConnectToNetwork> {
  TextEditingController _ipAddressController = TextEditingController();
  TextEditingController _portController = TextEditingController();
  TextEditingController _startPathController = TextEditingController();
  TextEditingController _reciveIpAddressController = TextEditingController();
  TextEditingController _recivePortController = TextEditingController();
  TextEditingController _reciveStartPathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<NetworkSettingsBloc>()..add(GetSavedNetworkSettingsEvent()),
        child: Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            title: const Text(
              'Network Settings',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            backgroundColor: darkappbar,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: BlocBuilder<NetworkSettingsBloc,NetworkSettingsState>(
            builder: (context,state){
              if(state is NetworkSettingsStateLoading ){
                return Center(child: CircularProgressIndicator());
              }else if(state is NetworkSettingsStateLoaded){
                if(state.networkSettings.isNotEmpty){
                  _ipAddressController.text = state.networkSettings.last.incomingIp;
                  _portController.text = state.networkSettings.last.incomingPort;
                  _startPathController.text = state.networkSettings.last.incomingStartPath;
                  _reciveIpAddressController.text = state.networkSettings.last.receiveIpAddress;
                  _recivePortController.text = state.networkSettings.last.port;
                  _reciveStartPathController.text = state.networkSettings.last.startPath;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSection("Outgoing", [
                          CustomTextField(labelText: "Ip Address",
                              hintText: "127.0.0",
                              controller: _ipAddressController),
                          CustomTextField(labelText: "Port",
                              hintText: "8080",
                              controller: _portController),
                          CustomTextField(labelText: "Start Path",
                              hintText: "/beyond/general...",
                              controller: _startPathController),
                        ],
                            "Send commands to the connected Device"
                        ),
                        const SizedBox(height: 20.0),
                        buildSection("Incoming", [
                          CustomTextField(labelText: "Ip Address",
                              hintText: "127.0.0",
                              controller: _reciveIpAddressController),
                          CustomTextField(labelText: "Port",
                              hintText: "8080",
                              controller: _recivePortController),
                          CustomTextField(
                              labelText: "Start Path",
                              hintText: "/beyond/general...",
                              controller: _reciveStartPathController),
                        ],
                            "Listen to the incoming commands"
                        ),

                        Builder(
                          builder: (context) =>
                              RoundedButtonWithLoading(
                                buttonText: "Connect",
                                onPressed: (text) {
                                  BlocProvider.of<NetworkSettingsBloc>(context).add(NetworkSettingsEventSave(
                                    NetworkSettings(
                                      receiveIpAddress: _reciveIpAddressController.text,
                                      port: _recivePortController.text,
                                      startPath: _reciveStartPathController.text,
                                      incomingIp: _ipAddressController.text,
                                      incomingPort: _portController.text,
                                      incomingStartPath: _startPathController.text,
                                    ),
                                  ));
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (context) => Home()),
                                          (route) => false);
                                },
                                color: Colors.blue,
                              ),
                        )
                      ],
                    ),
                  );
                }
              }
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSection("Outgoing", [
                      CustomTextField(labelText: "Ip Address",
                          hintText: "127.0.0",
                          controller: _ipAddressController),
                      CustomTextField(labelText: "Port",
                          hintText: "8080",
                          controller: _portController),
                      CustomTextField(labelText: "Start Path",
                          hintText: "/beyond/general...",
                          controller: _startPathController),
                    ],
                        "Send commands to the connected Device"
                    ),
                    const SizedBox(height: 20.0),
                    buildSection("Incoming", [
                      CustomTextField(labelText: "Ip Address",
                          hintText: "127.0.0",
                          controller: _reciveIpAddressController),
                      CustomTextField(labelText: "Port",
                          hintText: "8080",
                          controller: _recivePortController),
                      CustomTextField(
                          labelText: "Start Path",
                          hintText: "/beyond/general...",
                          controller: _reciveStartPathController),
                    ],
                        "Listen to the incoming commands"
                    ),

                    Builder(
                      builder: (context) =>
                          RoundedButtonWithLoading(
                            buttonText: "Connect",
                            onPressed: (text) {
                              BlocProvider.of<NetworkSettingsBloc>(context).add(NetworkSettingsEventSave(
                                NetworkSettings(
                                  receiveIpAddress: _reciveIpAddressController.text,
                                  port: _recivePortController.text,
                                  startPath: _reciveStartPathController.text,
                                  incomingIp: _ipAddressController.text,
                                  incomingPort: _portController.text,
                                  incomingStartPath: _startPathController.text,
                                ),
                              ));
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                      (route) => false);
                            },
                            color: Colors.blue,
                          ),
                    )
                  ],
                ),
              );
            },
          ),


        ),
    );
  }

  Widget buildSection(String title, List<Widget> fields,
      String tooltipMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: lgblue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 8.0),
            Tooltip(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              showDuration: const Duration(seconds: 2),
              message: tooltipMessage,
              triggerMode: TooltipTriggerMode.tap,
              child: const Icon(
                Icons.info_outline,
                color: Colors.grey,
                size: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        ...fields,
      ],
    );
  }

}
