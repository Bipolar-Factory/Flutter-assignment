import 'package:mimichat/app/locator.dart';
import 'package:mimichat/datamodels/user_model.dart';
import 'package:mimichat/services/local_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel{
  LocalDataService _localData = locator<LocalDataService>();
  DialogService _dialog = locator<DialogService>();

  String get name => _localData.user.name;

  void changeName(String name){
    _localData.user = UserModel(name: name);
    _dialog.showDialog(title: 'Success', description: 'Your name has changed');
  }

}