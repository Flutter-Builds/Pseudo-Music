import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/utils/constants.dart';
import 'package:pseudomusic/utils/variables.dart';
import 'package:pseudomusic/widgets/colorpicker.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color color;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            dense: true,
            leading: Icon(
              MaterialCommunityIcons.palette,
              size: 20.0,
              color: color,
            ),
            title: Text(
              'Accent Color',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 70.0),
            title: Text('Color'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return ColorPickerDialog();
              },
            ),
          ),
          SizedBox(
            width: 200.0,
            child: Divider(
              thickness: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              MaterialCommunityIcons.lightbulb,
              size: 20.0,
              color: color,
            ),
            title: Text(
              'Disco',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            title: Text('Disco Mode'),
            activeColor: color,
            value: disco,
            onChanged: (value) {
              setState(() {
                disco = value;
                listdiscoController.add(true);
              });
            },
          ),
          RadioListTile<DiscoModes>(
            title: const Text('Unison'),
            value: DiscoModes.unison,
            activeColor: color,
            groupValue: discomode,
            onChanged: disco
                ? (DiscoModes value) {
                    setState(() {
                      discomode = value;
                      listdiscoController.add(true);
                    });
                  }
                : null,
          ),
          RadioListTile<DiscoModes>(
            title: const Text('Random'),
            value: DiscoModes.random,
            activeColor: color,
            groupValue: discomode,
            onChanged: disco
                ? (DiscoModes value) {
                    setState(() {
                      discomode = value;
                      listdiscoController.add(true);
                    });
                  }
                : null,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30.0),
            enabled: disco,
            dense: true,
            title: Text(
              'Mode Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          RadioListTile<DiscoModeStatus>(
            title: const Text('Always'),
            value: DiscoModeStatus.always,
            activeColor: color,
            groupValue: modeStatus,
            onChanged: disco
                ? (DiscoModeStatus value) {
                    setState(() {
                      modeStatus = value;
                    });
                  }
                : null,
          ),
          RadioListTile<DiscoModeStatus>(
            title: const Text('When Playing'),
            value: DiscoModeStatus.onplay,
            activeColor: color,
            groupValue: modeStatus,
            onChanged: disco
                ? (DiscoModeStatus value) {
                    setState(() {
                      modeStatus = value;
                    });
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
