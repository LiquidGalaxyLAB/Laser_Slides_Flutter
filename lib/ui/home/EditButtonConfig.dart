import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laser_slides_flutter/colors/Colors.dart';
import 'package:laser_slides_flutter/injectionContainer.dart';
import 'package:laser_slides_flutter/model/local/NetworkEntity.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkBloc.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_event.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_state.dart';
import 'package:laser_slides_flutter/ui/home/Home.dart';
import 'package:laser_slides_flutter/ui/widgets/CircularButton.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../widgets/RounButtonAnim.dart';

class MyEditButtonConfig extends StatefulWidget {
  final int id;
  MyEditButtonConfig({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EditButtonConfig();
}

class EditButtonConfig extends State<MyEditButtonConfig> {
  final TextEditingController _labelTextController = TextEditingController();
  final TextEditingController _buttonPressedController =
  TextEditingController();
  final TextEditingController _buttonReleasedController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NetworkBloc>()..add(GetSavedNetworkConfigEvent()),
      child: Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            title: const Text(
              'Edit Configuration',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: darkappbar,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: BlocBuilder<NetworkBloc,NetworkConfigState> (
            builder: (context,state){
              if(state.networkEntities.isNotEmpty){
                if (widget.id >= 0 && widget.id < state.networkEntities.length) {
                  _labelTextController.text = state.networkEntities[widget.id].label;
                  _buttonPressedController.text = state.networkEntities[widget.id].buttonPressedCommand;
                  _buttonReleasedController.text = state.networkEntities[widget.id].buttonReleasedCommand;
                }
              }
              if(state is NetworkConfigStateLoading ){
                return Center(child: CircularProgressIndicator());
              }else if(state is NetworkConfigStateLoaded){
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: "Label",
                        hintText: "eg. Btn1",
                        controller: _labelTextController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      CustomTextField(
                        labelText: "Button Pressed",
                        hintText: "eg. /beyond/general",
                        controller: _buttonPressedController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      CustomTextField(
                        labelText: "Button Released",
                        hintText: "eg. /beyond/master/blackout",
                        controller: _buttonReleasedController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),

                      Builder(
                        builder:(context) =>
                            RoundedButtonWithLoading(
                              buttonText: "Save",
                              onPressed: (text) {
                                BlocProvider.of<NetworkBloc>(context).add(NetworkConfigEventSave(
                                    NetworkEntity(
                                        id: widget.id,
                                        label: _labelTextController.text,
                                        buttonPressedCommand: _buttonPressedController.text,
                                        buttonReleasedCommand: _buttonReleasedController.text,
                                        isReleaseChecked: false))
                                );
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) => Home()),
                                        (route) => false);
                              },
                              color: Colors.blue,
                            ),
                      )

                      // saveNetworkButton(),
                      // cancelNetworkButton(),
                    ],
                  ),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "Label",
                      hintText: "Btn1",
                      controller: _labelTextController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CustomTextField(
                      labelText: "Button Pressed",
                      hintText: "Btn1",
                      controller: _buttonPressedController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CustomTextField(
                      labelText: "Button Released",
                      hintText: "Btn1",
                      controller: _buttonReleasedController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),

                    Builder(
                      builder:(context) =>
                          RoundedButtonWithLoading(
                            buttonText: "Save",
                            onPressed: (text) {
                              BlocProvider.of<NetworkBloc>(context).add(NetworkConfigEventSave(
                                  NetworkEntity(
                                      id: widget.id,
                                      label: _labelTextController.text,
                                      buttonPressedCommand: _buttonPressedController.text,
                                      buttonReleasedCommand: _buttonReleasedController.text,
                                      isReleaseChecked: false))
                              );
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                      (route) => false);
                            },
                            color: Colors.blue,
                          ),
                    )

                    // saveNetworkButton(),
                    // cancelNetworkButton(),
                  ],
                ),
              );
            },
          )

      ),
    );
  }
}



/*Padding saveNetworkButton() {
  return Padding(
    padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 12),
    child: Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Save", style: TextStyle(fontSize: 14)),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(lgblue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.white)),
          ),
        ),
        onPressed: () {},
      ),
    ),
  );
}

Padding cancelNetworkButton() {
  return Padding(
    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
    child: Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Cancel", style: TextStyle(fontSize: 14)),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(lgred),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.white)),
          ),
        ),
        onPressed: () {},
      ),
    ),
  );
}*/

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 2.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  CustomTextField({
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.labelText,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 20, top: 4, right: 20, bottom: 4),
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                filled: true,
                fillColor: darkappbar,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: lgblue),
                ),
                border: OutlineInputBorder(),
                hintText: widget.hintText,
                hintStyle: TextStyle(color: CupertinoColors.systemGrey),
              ),
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super. dispose();
  }
}
