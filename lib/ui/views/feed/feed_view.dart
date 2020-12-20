import 'package:flutter/material.dart';
import 'package:mimichat/ui/views/chat/chat_view.dart';
import 'package:mimichat/ui/views/feed/feed_viewmodel.dart';
import 'package:mimichat/ui/widgets/feed_tile.dart';
import 'package:stacked/stacked.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.nonReactive(
        builder: (context, model, child){
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add, color: Colors.white),
              backgroundColor: Color(0xff6c63ff),
              onPressed: model.newChat,
            ),
            body: SafeArea(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    expandedHeight: 100,
                    floating: false,
                    pinned: true,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.only(left: 16, bottom: 8),
                      title: Text('Mimichat', style: Theme.of(context).textTheme.headline5),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.account_circle_outlined),
                        onPressed: model.gotoSettings,
                      ),
                    ],
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 48),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, i){
                            return FeedTile(
                              profileImage: model.profileImages[i],
                              name: model.names[i],
                              lastMessage: model.lastMessages[i],
                              time: model.times[i],
                              onPressed: ()=>model.gotoChat(model.names[i]),
                            );
                          },
                        childCount: model.profileImages.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => FeedViewModel(),
    );
  }
}
