import 'package:flutter/material.dart';
import 'package:mimichat/ui/views/chat/chat_viewmodel.dart';
import 'package:mimichat/ui/widgets/message_box.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController _messageController;

  @override
  void initState() {
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              '???',
              style: Theme.of(context).textTheme.headline5,
            ),
            titleSpacing: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.purple),
              onPressed: model.back,
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.messages.length,
                  itemBuilder: (context, i) {
                    return MessageBox(message: model.messages[i]);
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          labelText: 'Message',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send_rounded),
                    onPressed: () {
                      _messageController.text = '';
                      model.sendText(_messageController.text);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => ChatViewModel(),
    );
  }
}
