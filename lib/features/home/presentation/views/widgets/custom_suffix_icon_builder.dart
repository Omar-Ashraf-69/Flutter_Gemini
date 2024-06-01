import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/features/home/presentation/managers/cubit/gemini_cubit_cubit.dart';
import 'package:gemini/features/home/presentation/views/widgets/custom_send_icon_button.dart';
import 'package:gemini/features/home/presentation/views/widgets/speech_to_text_widget.dart';

class CustomSuffixIconBuilder extends StatelessWidget {
  const CustomSuffixIconBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeminiCubit, GeminiState>(
      builder: (context, geminiState) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SpeechToTextWidget(),
            (geminiState is GeminiLoading)
                ? const Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 8),
                    child: CupertinoActivityIndicator(),
                  )
                : const CustomSendIconButton(),
          ],
        );
      },
    );
  }
}
