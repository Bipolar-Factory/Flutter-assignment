import 'package:flutter/material.dart';
import 'package:mimichat/app/app_theme.dart';
import 'package:mimichat/ui/views/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(
                Icons.account_circle_outlined,
                color: Color(0xff6c63ff),
                size: 150,
              ),
            ),
          ),
          Expanded(
            child: ViewModelBuilder<SettingsViewModel>.reactive(
              onModelReady: (model)=>_nameController.text = model.name,
              builder: (context, model, child) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextField(
                        controller: _nameController,
                      ),
                    ),
                    RaisedButton(
                      child: Text('Change Name'),
                      onPressed: ()=>model.changeName(_nameController.text),
                      color: Color(0xff6f63ff),
                      textColor: Colors.white,
                    ),
                  ],
                );
              },
              viewModelBuilder: () => SettingsViewModel(),
            ),
          ),
        ],
      ),
    );
  }
}
