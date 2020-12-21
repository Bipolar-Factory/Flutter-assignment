import 'package:mimichat/app/locator.dart';
import 'package:mimichat/app/router.gr.dart';
import 'package:mimichat/datamodels/user_model.dart';
import 'package:mimichat/services/local_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel{
  LocalDataService _localData = locator<LocalDataService>();
  NavigationService _navigator = locator<NavigationService>();

  void initialize() async {
    //Minimum delay of 3 seconds
    await Future.delayed(Duration(seconds: 3));
    UserModel user = _localData.user;
    if(user == null){
      _navigator.replaceWith(Routes.intro);
    }else{
      _navigator.replaceWith(Routes.feed);
    }
  }
}