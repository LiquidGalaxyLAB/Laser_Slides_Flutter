import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laser_slides_flutter/ui/home/EditButtonConfig.dart';
import 'package:laser_slides_flutter/ui/home/Home.dart';
import 'package:laser_slides_flutter/ui/home/settings/AboutPage.dart';
import 'package:laser_slides_flutter/ui/home/settings/PastNetworks.dart';
import 'package:laser_slides_flutter/ui/home/settings/buttonControls.dart';
import 'package:laser_slides_flutter/ui/networkConnectionUis/ConnectToTheNetwork.dart';
import 'package:laser_slides_flutter/ui/widgets/TopAppBar.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../colors/Colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
      body: Container(
        color: background,
        child: SettingsList(
            lightTheme: const SettingsThemeData(
                dividerColor: Colors.pink,
                tileDescriptionTextColor: lgblue,
                leadingIconsColor: Colors.white,
                settingsListBackground: background,
                tileHighlightColor: Colors.yellow,
                titleTextColor: Colors.white,
                trailingTextColor: Colors.white,
                settingsTileTextColor: Colors.white,
                settingsSectionBackground: darkappbar),
            sections: [
              SettingsSection(title: Text('Button'), tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.edit),
                  title: const Text(
                    'Button Controls',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: const Text('Edit button configuration'),
                  onPressed: (BuildContext context) {
                    Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(
                        builder: (context) => const Home()
                    ), (route) => false);
                  },
                ),
              ]),

              SettingsSection(title: Text('Network'), tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.network_check),
                  title: const Text(
                    'Change Network',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: const Text('Add a new network'),
                  onPressed: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConnectToNetwork()
                      ),
                    );
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.save),
                  title: const Text(
                    'Past Networks',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: const Text('Connect past network'),
                  onPressed: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PastNetworks()
                      ),
                    );
                  },
                ),
              ]),
              SettingsSection(title: Text('About'), tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.info),
                  title: const Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: const Text('Know About Laser Slides'),
                  onPressed: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutPage()
                      ),
                    );
                  },
                ),
                // SettingsTile.navigation(
                //   leading: Icon(Icons.keyboard_command_key),
                //   title: const Text(
                //     'Guide',
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   value: const Text('Learn about OSC commands'),
                //   onPressed: (BuildContext context) {},
                // ),
              ])
            ]),
      ),
    );
  }
}
