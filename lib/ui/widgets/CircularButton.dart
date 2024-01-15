import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laser_slides_flutter/colors/Colors.dart';
import 'package:laser_slides_flutter/model/local/NetworkEntity.dart';
import 'package:laser_slides_flutter/model/local/NetworkSettings.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkBloc.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_event.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_state.dart';
import 'package:laser_slides_flutter/ui/bloc/osc/OscEvent.dart';
import 'package:laser_slides_flutter/ui/bloc/osc/OscSenderBloc.dart';
import 'package:laser_slides_flutter/ui/home/EditButtonConfig.dart';
import 'package:lottie/lottie.dart';

import '../../injectionContainer.dart';
import '../bloc/NetworkSettings/NetworkSettingsBloc.dart';
import '../bloc/NetworkSettings/NetworkSettingsEvent.dart';
import '../bloc/NetworkSettings/NetworkSettingsState.dart';

class MyCircularButton extends StatefulWidget {
  final int id;
  final List<NetworkSettings> networkSettings;
  final List<NetworkEntity> networkEntity;

  const MyCircularButton(
      {Key? key,
      required this.id,
      required this.networkSettings,
      required this.networkEntity})
      : super(key: key);

  @override
  _MyCircularButtonState createState() => _MyCircularButtonState();
}

class _MyCircularButtonState extends State<MyCircularButton>
    with TickerProviderStateMixin {
  bool isButtonPressed = false;


  void buttonPressed() {
    setState(() {
      isButtonPressed = !isButtonPressed;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: BlocProvider(
          create: (_) => sl<OSCSenderBloc>(),
          child: CircularButton(
            onTap: buttonPressed,
            isButtonPressed: isButtonPressed,
            id: widget.id,
            networkSettings: widget.networkSettings,
            networkEntity: widget.networkEntity,
          ),
        ));
  }
}

class CircularButton extends StatelessWidget {
  final int id;
  final onTap;
  final bool isButtonPressed;
  final List<NetworkSettings> networkSettings;
  final List<NetworkEntity> networkEntity;
  const CircularButton(
      {Key? key,
      required this.onTap,
      required this.isButtonPressed ,
      required this.id,
      required this.networkSettings,
      required this.networkEntity})
      : super(key: key);

List<String> get oscPath {
  return [
    networkSettings.last.incomingIp, // Destination IP
    networkSettings.last.incomingPort, // Port
    "${networkSettings.last.incomingStartPath}/${networkEntity[id-1].buttonPressedCommand}"
  ];  // OSC address
}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<NetworkBloc>()..add(GetSavedNetworkConfigEvent()),
        child: BlocBuilder<NetworkBloc, NetworkConfigState>(
          builder: (context, state) {
            if (state is NetworkConfigStateLoaded){
              return Builder(
                  builder: (context0) => Stack(
                    alignment: Alignment.topRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          try{
                            List<String> oscPath = [
                              networkSettings.last.incomingIp, // Destination IP
                              networkSettings.last.incomingPort, // Port
                              "${networkSettings.last.incomingStartPath}/${state.networkEntities[id-1].buttonPressedCommand}"
                            ];
                            onTap();
                            print("this is osc path hai $oscPath");
                            BlocProvider.of<OSCSenderBloc>(context0)
                                .add(SendOscEvent(oscPath));
                          }catch(e){
                            //show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please Configure the Button first'),
                              ),
                            );
                          }

                        },
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(80),
                                boxShadow: !isButtonPressed
                                    ? []
                                    : [
                                  BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                    offset: const Offset(6, 6),
                                  ),
                                  //lighter shadow
                                  const BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                    offset: Offset(-6, -6),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.lightbulb_circle_outlined,
                                color: !isButtonPressed ? Colors.grey : Colors.green[700],
                                size: 50,
                              ),
                            ),
                            Text(
                              (state.networkEntities.isNotEmpty && id >= 0 && id < state.networkEntities.length)
                                  ? state.networkEntities[id-1].label
                                  : "Button $id",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),

                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyEditButtonConfig(
                                    id: id,
                                  )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lgblue, // Customize the color as needed
                          ),
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ));
            }else if(state is NetworkConfigStateLoading){
              return const Center(child: CircularProgressIndicator());
            }
            return Container(
              height: 20,
              color: Colors.red,
            );
          }
        )
    );


  }
}
