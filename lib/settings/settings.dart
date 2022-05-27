import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting extends StatelessWidget {

 Setting({Key? key}) : super(key: key);
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
        backgroundColor: Colors.amber,
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_on_outlined))
        ],
        titleSpacing: 4.0,
      ),
      body: SettingsList(
        applicationType: ApplicationType.both,
        platform: DevicePlatform.web,
        brightness: Brightness.dark,
        contentPadding: EdgeInsets.all(5.0),
        shrinkWrap: true,
        sections: [
          SettingsSection(
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                title: Text('Reminder'),
                leading: Icon(Icons.alarm_add_outlined),
                value: Text('10 minutes'),
                // onPressed: ,
                // TimePickerDialog(
                //   initialTime: TimeOfDay.now(),
                // )
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
              SettingsTile.switchTile(
                onToggle: (darkMode) {},
                initialValue: false,
                leading: Icon(Icons.dark_mode),
                title: Text('Dark mode'),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
