import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/core/managers/speech_cubit/speech_cubit.dart';
import 'package:gemini/core/utils/colors.dart';
import 'package:gemini/features/home/presentation/managers/cubit/gemini_cubit_cubit.dart';

class CustomSendIconButton extends StatelessWidget {
  const CustomSendIconButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: BlocProvider.of<GeminiCubit>(context).controller.text.isEmpty
          ? null
          : () async {
              BlocProvider.of<GeminiCubit>(context).message =
                  BlocProvider.of<GeminiCubit>(context).controller.text;
              BlocProvider.of<GeminiCubit>(context).focusNode.unfocus();
              BlocProvider.of<GeminiCubit>(context).controller.clear();
              BlocProvider.of<GeminiCubit>(context).messHistory.add(
                {
                  'role': 'USER',
                  'message': BlocProvider.of<GeminiCubit>(context).message
                },
              );

              context.read<SpeechCubit>().deleteMessage();

              await BlocProvider.of<GeminiCubit>(context)
                  .chat(message: BlocProvider.of<GeminiCubit>(context).message);

              // cubit.messHistory.add({
              //   'role': 'CHATBOT',
              //   'message': controller.text
              // });
            },
      icon: const Icon(
        Icons.send,
        color: kPrimaryColor,
      ),
    );
  }
}
