import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/core/managers/speech_cubit/speech_cubit.dart';
import 'package:gemini/core/utils/app_images.dart';
import 'package:gemini/core/utils/colors.dart';
import 'package:gemini/features/home/presentation/views/widgets/chat_list_bluider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<Map<String, String>> messHistory = [];
  String message = '';
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AspectRatio(
            aspectRatio: 40 / 4,
            child: Image.asset(
              Assets.appLogo,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Expanded(
                  child: ChatListBuilder(
                    messages: messHistory,
                  ),
                ),
                BlocBuilder<SpeechCubit, SpeechState>(
                  builder: (context, state) {
                    if (state is SpeechListening) {
                      controller.text = state.recognizedWords;
                    }
                    return TextField(
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      controller: controller,
                      focusNode: focusNode,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter a message',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        focusedBorder: customedBorder(),
                        enabledBorder: customedBorder(),
                        prefixIconColor: Colors.white,
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BlocBuilder<SpeechCubit, SpeechState>(
                              builder: (context, state) {
                                final speechCubit = context.read<SpeechCubit>();
                                return IconButton(
                                  onPressed: () {
                                    if (speechCubit.isListening) {
                                      speechCubit.stopListening();
                                    } else {
                                      speechCubit.startListening();
                                    }
                                  },
                                  tooltip: 'Listen',
                                  icon: Icon(
                                    speechCubit.isListening
                                        ? Icons.mic
                                        : Icons.mic_off,
                                    color: kPrimaryColor,
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () async {
                                message = controller.text;
                                context.read<SpeechCubit>().deleteMessage();
                                controller.clear();
                                messHistory.add({
                                  'role': 'USER',
                                  'message': message,
                                });
                                setState(() {});
                                controller.clear();
                                focusNode.unfocus();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.send,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        suffixIconColor: Colors.white,
                      ),
                    );
                  },
                )
              ],
            )));
  }
}

OutlineInputBorder customedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: const BorderSide(
      color: kPrimaryColor,
    ),
  );
}
