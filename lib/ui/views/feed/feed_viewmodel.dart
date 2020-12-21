import 'package:mimichat/app/constants.dart';
import 'package:mimichat/app/locator.dart';
import 'package:mimichat/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FeedViewModel extends BaseViewModel {
  NavigationService _navigator = locator<NavigationService>();
  DialogService _dialog = locator<DialogService>();

  List<String> profileImages = [
    profile1Image,
    profile2Image,
    profile3Image,
    profile4Image,
    profile5Image,
    profile6Image,
    profile7Image,
    profile8Image,
  ];

  List<String> names = [
    "Aaryan Verma",
    "Monalisha Nayak",
    "Alok Sathpathy",
    "Sonia Iich",
    "Abhijeet Oomar",
    "Biyanka Kashyap",
    "Amit Reddy",
    "Sareena Rai",
  ];

  List<String> lastMessages = [
    "How are you?",
    "I am on it!",
    "Get ready as soon as possible",
    "Select Me!",
    "That's a good idea",
    "Yes, definitely...",
    "Ready to rock!!!",
    "I will do it by tomorrow",
  ];

  List<String> times = [
    "11:00 am",
    "10:24 am",
    "08:54 am",
    "07:22 am",
    "06:00 am",
    "yesterday",
    "16/12",
    "15/12",
  ];

  void newChat() {
    _dialog.showDialog(
        title: 'Oops!', description: 'This feature hasn\'t been implemented yet', buttonTitle: 'No problem');
  }

  void gotoSettings() {
    _navigator.navigateTo(Routes.settings);
  }

  void gotoChat(String name, String image) {
    _navigator.navigateTo(Routes.chat,
        arguments: ChatViewArguments(
          name: name,
          image: image,
        ));
  }
}
