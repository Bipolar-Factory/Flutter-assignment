import 'package:flutter/material.dart';
import 'package:mimichat/ui/views/chat/chat_view.dart';
import 'package:mimichat/ui/views/feed/feed_viewmodel.dart';
import 'package:mimichat/ui/widgets/feed_tile.dart';
import 'package:stacked/stacked.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.nonReactive(
      builder: (context, model, child) {
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
                    titlePadding: EdgeInsets.only(left: 16, bottom: 6),
                    title: Text('Mimichat', style: Theme.of(context).textTheme.headline6),
                    background: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(bottom: 6, left: 16),
                      child: Container(
                        width: 150,
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.person_outline_rounded,
                        size: 32,
                        color: Colors.black87,
                      ),
                      onPressed: model.gotoSettings,
                    ),
                  ],
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 48),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        return FeedTile(
                          profileImage: model.profileImages[i],
                          name: model.names[i],
                          lastMessage: model.lastMessages[i],
                          time: model.times[i],
                          onPressed: () => model.gotoChat(
                            model.names[i],
                            model.profileImages[i],
                          ),
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
