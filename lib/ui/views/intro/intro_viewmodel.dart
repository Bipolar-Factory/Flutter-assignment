import 'package:mimichat/app/locator.dart';
import 'package:mimichat/app/router.gr.dart';
import 'package:mimichat/datamodels/user_model.dart';
import 'package:mimichat/services/local_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IntroViewModel extends BaseViewModel{
  LocalDataService _localData = locator<LocalDataService>();
  NavigationService _navigator = locator<NavigationService>();

  void submit(String name){
    _localData.user = UserModel(name: name);
    _navigator.replaceWith(Routes.feed);
  }
}