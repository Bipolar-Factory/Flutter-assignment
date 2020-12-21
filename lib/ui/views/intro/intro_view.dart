import 'package:flutter/material.dart';
import 'package:mimichat/app/constants.dart';
import 'package:mimichat/ui/views/intro/intro_viewmodel.dart';
import 'package:stacked/stacked.dart';

class IntroView extends StatefulWidget {
  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntroViewModel>.nonReactive(
      builder: (context, model, child) {
        Widget nameEntry = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xff6c63ff),
                  size: 32,
                ),
                onPressed: () => model.submit(_nameController.text),
              ),
            ),
          ],
        );
        List<Widget> welcomeMessage = [
          Text(
            'Almost there   : )',
            style: Theme.of(context).textTheme.headline5,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to Mimichat, we need to know your name before continuing!',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
        ];
        Widget welcomeImg = Container(
          padding: EdgeInsets.all(32),
          child: Image.asset(welcomeImage),
        );

        // OrientationBuilder(
        //   builder: (context, orientation){
        //     if(orientation == Orientation.portrait){
        //
        //     }else{
        //
        //     }
        //   },
        // ),
        return Scaffold(
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            welcomeImg,
                            SizedBox(height: 16),
                            ...welcomeMessage,
                          ],
                        ),
                      ),
                    ),
                    nameEntry,
                  ],
                );
              } else {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: welcomeImg,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [...welcomeMessage, nameEntry],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          // body: Column(
          //   children: [
          //     Expanded(
          //       child: SingleChildScrollView(
          //         physics: BouncingScrollPhysics(),
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             welcomeImg,
          //             SizedBox(height: 16),
          //             ...welcomeMessage,
          //           ],
          //         ),
          //       ),
          //     ),
          //     nameEntry,
          //   ],
          // ),
        );
      },
      viewModelBuilder: () => IntroViewModel(),
    );
  }
}
