import 'package:flutter/material.dart';
import 'package:gemini/features/home/presentation/views/widgets/chat_bubble.dart';
import 'package:gemini/features/home/presentation/views/widgets/chat_bubble_for_the_chatbot.dart';

class ChatListBuilder extends StatelessWidget {
  const ChatListBuilder({
    super.key,
    required this.messages,
  });
  final List<Map<String, String>> messages;
  static final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ChatListBuilder.controller,
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) =>
          messages[messages.length - index - 1]['role'] == 'CHATBOT'
              ? ChatBubble(
                  message: messages[messages.length - index - 1]['message']!,
                )
              : ChatBubbleForAFriend(
                  message: messages[messages.length - index - 1]['message']!,
                ),
    );
  }

  static void scrollToTheEnd() {
    controller.jumpTo(0);
  }
}
