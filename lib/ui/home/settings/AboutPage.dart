import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/Colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: Text(
            'About',
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 00, top: 20),
                child: Image.asset('assets/images/laserslides.jpg'),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 00, top: 20),
                child: const Text(
                  "LaserSlides is a very simple, dirty and quick OSC (Open Sound Control) application which lets you modify OSC messages on your phone/tablet, ready to be shown for your laser presentations. This Android application controls the BEYOND laser software by Pangolin.\n\n"
                      "(C) Pangolin Laser Systems, Inc. (Pangolin.com)\n\n"
                      "OSC is a protocol for networking sound synthesizers, computers and other media devices usually for show control or musical performance.\n\n"
                      "On the BEYOND application, we must go to OSC settings and look for the ip shown. Once we know the ip, we must go to the “network” button on the LaserSlides app and put the ip that we have seen at BEYOND.\n\n"
                      "Now that we are connected, if we press the “edit mode” button on the top right, we will be able to edit all buttons to suit our needs. Once we have pressed the “edit mode” button, (we know if we are in edit mode if the background is black/gray), we can press all buttons displayed on the screen.\n\n"
                      "Let’s edit the “button 1”. On the label, we have to put the name we want to see at the button. On the button pressed field, we are going to put the BEYOND PATH where the image we want to display is stored. First and foremost, we must know how BEYOND PATH works, the first cell is the 0 0, and the first row goes from 0 0, to 0 9. The second row 0 10, to 0 19 and so on. Once we know this, the command we have to use is: beyond/general/startcue 0 0 (for the first cell) There are other default commands as blackout: beyond/master/blackout\n\n"
                      "All the OSC commands references can be found at https://wiki.pangolin.com/beyond:osc_commands Finally we save the modifications and if we do not want to keep editing, we press again the “edit mode”.",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              )
            ],
          ),
        )


    );
  }
}