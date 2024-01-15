import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laser_slides_flutter/model/local/NetworkEntity.dart';
import 'package:laser_slides_flutter/model/local/NetworkSettings.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_event.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_state.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsEvent.dart';
import 'package:laser_slides_flutter/ui/widgets/CircularButton.dart';

import '../../../colors/Colors.dart';
import '../../../injectionContainer.dart';
import '../../bloc/NetworkBloc.dart';

class ButtonControls extends StatefulWidget {
  final bool isConnected;
  final List<NetworkSettings> networkSettings;

  const ButtonControls(
      {Key? key, required this.isConnected, this.networkSettings = const []})
      : super(key: key);

  @override
  State<ButtonControls> createState() => _ButtonControlsState();
}

class _ButtonControlsState extends State<ButtonControls> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NetworkBloc>()..add(const GetSavedNetworkConfigEvent()),
      child: BlocBuilder<NetworkBloc, NetworkConfigState>(
        builder: (context, state) {
          print("this is the length of  ${state.networkEntities.length}");
          if (state is NetworkConfigStateLoading) {
            print("this is the length of  ${state.networkEntities.length}");
            return _buildButtonControls(
                state.networkEntities, widget.isConnected, context,widget.networkSettings);
          } else if (state is NetworkConfigStateLoaded) {
            print("this is the length of  ${state.networkEntities.length}");
            return _buildButtonControls(
                state.networkEntities, widget.isConnected, context,widget.networkSettings);
          } else {
            print("this is the length of  ${state.networkEntities.length}");
            return _buildButtonControls([], widget.isConnected, context,widget.networkSettings);
          }
        },
      ),
    );
  }
}

Widget _buildButtonControls(List<NetworkEntity> networkEntities, bool isConnected, BuildContext context, List<NetworkSettings> networkSettings) {

  return Scaffold(
      backgroundColor: background,
      appBar: isConnected
          ? PreferredSize(
              preferredSize: Size.zero, // AppBar with zero height
              child: Container(), // Empty container to occupy zero space
            )
          : AppBar(
              title: Text(
                'Button Controls',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              backgroundColor: darkappbar,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
      body: SingleChildScrollView(
          child: Container(
        color: background,
        child: Column(
          children: [
            isConnected
                ? Container(
                    color: lggreen,
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wifi,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        // Adjust the spacing as needed
                        Text(
                          networkSettings.last.incomingIp,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ))
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          child: MyCircularButton(id: 1,networkSettings: networkSettings,networkEntity: networkEntities),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 2,networkSettings: networkSettings,networkEntity: networkEntities),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 3,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child:  MyCircularButton(id: 4,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 5,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 6,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 7,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child:  MyCircularButton(id: 8,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 9,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 10,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 11,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 12,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 13,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 14,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: MyCircularButton(id: 15,networkSettings: networkSettings,networkEntity: networkEntities)
                  ),
                ),
              ],
            ),
          ],
        ),
      )));
}
