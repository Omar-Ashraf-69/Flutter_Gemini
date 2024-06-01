import 'package:flutter/material.dart';
import 'package:gemini/features/home/presentation/views/widgets/chat_list_builder.dart';
import 'package:gemini/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:gemini/features/home/presentation/views/widgets/custom_text_field_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ChatListBuilder(),
            SizedBox(
              height: 4,
            ),
            CustomTextFieldBuilder(),
          ],
        ),
      ),
    );
  }
}
