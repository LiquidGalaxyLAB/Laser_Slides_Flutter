import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkBloc.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_event.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkConfig_state.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsBloc.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsEvent.dart';
import 'package:laser_slides_flutter/ui/bloc/NetworkSettings/NetworkSettingsState.dart';
import 'package:laser_slides_flutter/ui/home/EditButtonConfig.dart';
import 'package:laser_slides_flutter/ui/home/settings/PastNetworks.dart';
import 'package:laser_slides_flutter/ui/home/settings/SettingsPage.dart';
import 'package:laser_slides_flutter/ui/home/settings/buttonControls.dart';
import 'package:laser_slides_flutter/ui/networkConnectionUis/ConnectToTheNetwork.dart';
import 'package:lottie/lottie.dart';
import 'package:particles_flutter/particles_flutter.dart';

import '../../colors/Colors.dart';
import '../../injectionContainer.dart';
import '../../model/local/NetworkSettings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => sl<NetworkSettingsBloc>()..add(const GetSavedNetworkSettingsEvent()),
      child:Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: Text(
            'Laser Slides',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PastNetworks())
                );
              },
              icon: const Icon(
                Icons.history,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(_createRouteLeftSlider());
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: darkappbar,
        ),
        body: BlocBuilder<NetworkSettingsBloc,NetworkSettingsState> (
          builder: (context,state){
            if(state is NetworkSettingsStateLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is NetworkSettingsStateLoaded){
              print("on full throttle");
              if(state.networkSettings.isEmpty){
                return Stack(
                  children: [
                    CircularParticle(
                      key: UniqueKey(),
                      awayRadius: 80,
                      numberOfParticles: 240,
                      speedOfParticles: 1,
                      height: screenHeight,
                      width: screenWidth,
                      onTapAnimation: true,
                      particleColor: Colors.white.withAlpha(150),
                      awayAnimationDuration: Duration(milliseconds: 600),
                      maxParticleSize: 2,
                      isRandSize: true,
                      isRandomColor: true,
                      randColorList: [
                        Colors.white.withAlpha(50),
                        darkappbar.withAlpha(210),
                        Colors.white.withAlpha(50),
                        darkappbar.withAlpha(210),
                      ],
                      awayAnimationCurve: Curves.easeInOutBack,
                      enableHover: true,
                      hoverColor: Colors.white.withAlpha(80),
                      hoverRadius: 90,
                      connectDots: false, //not recommended
                    ),
                    Column(
                      children: [
                        // Your other widgets/components go here
                        Positioned(
                          top: screenHeight * 0.5,
                          child: Lottie.asset(
                            'assets/lottie/rocketstarting.json',
                            repeat: true,
                          ),
                        ),

                        SizedBox(
                          width: screenWidth * 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(_createRoute());
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => MyEditButtonConfig()),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Colors.grey,
                              ),
                              child: const Text(
                                "Connect",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }else{
                return ButtonControls(isConnected: true,networkSettings: state.networkSettings);
              }
            }else{
              return Stack(
                children: [
                  CircularParticle(
                    key: UniqueKey(),
                    awayRadius: 80,
                    numberOfParticles: 240,
                    speedOfParticles: 1,
                    height: screenHeight,
                    width: screenWidth,
                    onTapAnimation: true,
                    particleColor: Colors.white.withAlpha(150),
                    awayAnimationDuration: Duration(milliseconds: 600),
                    maxParticleSize: 2,
                    isRandSize: true,
                    isRandomColor: true,
                    randColorList: [
                      Colors.white.withAlpha(50),
                      darkappbar.withAlpha(210),
                      Colors.white.withAlpha(50),
                      darkappbar.withAlpha(210),
                    ],
                    awayAnimationCurve: Curves.easeInOutBack,
                    enableHover: true,
                    hoverColor: Colors.white.withAlpha(80),
                    hoverRadius: 90,
                    connectDots: false, //not recommended
                  ),
                  Column(
                    children: [
                      // Your other widgets/components go here
                      Positioned(
                        top: screenHeight * 0.5,
                        child: Lottie.asset(
                          'assets/lottie/rocketstarting.json',
                          repeat: true,
                        ),
                      ),

                      SizedBox(
                        width: screenWidth * 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(_createRoute());
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => MyEditButtonConfig()),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.grey,
                            ),
                            child: const Text(
                              "Connect",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }


          },
        )


      ),
    );


  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ConnectToNetwork(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
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

Route _createRouteLeftSlider() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, -1.0); // Enter from the left
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

