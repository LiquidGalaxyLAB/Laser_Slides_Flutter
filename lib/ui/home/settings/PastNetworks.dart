import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsBloc.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsEvent.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsState.dart';

import '../../../colors/Colors.dart';
import '../../../injectionContainer.dart';

class PastNetworks extends StatefulWidget {
  const PastNetworks({Key? key}) : super(key: key);

  @override
  State<PastNetworks> createState() => _PastNetworksState();
}

class _PastNetworksState extends State<PastNetworks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'Available Networks',
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
      body: BlocProvider(
        create: (_) => sl<NetworkSettingsBloc>()..add(GetSavedNetworkSettingsEvent()),
        child: BlocBuilder<NetworkSettingsBloc, NetworkSettingsState>(
          builder: (context, state) {
            if (state is NetworkSettingsStateLoaded) {
              return ListView.builder(
                itemCount: state.networkSettings.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(top: 20.0,bottom: 5.0),
                    child:  Container(
                      color: darkappbar, // Set your desired color here
                      child: ListTile(
                        title: Text(state.networkSettings[index].incomingIp,style:
                          TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(state.networkSettings[index].incomingPort,style:
                        TextStyle(color: Colors.white)),
                      ),
                    ),

                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}


