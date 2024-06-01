import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  final SpeechToText _speechToText = SpeechToText();

  SpeechCubit() : super(SpeechInitial());

  Future<void> initialize() async {
    final speechEnabled = await _speechToText.initialize();
    if (speechEnabled) {
      emit(SpeechReady());
    } else {
      emit(const SpeechError("Speech recognition not available"));
    }
  }

  Future<void> startListening() async {
    if (state is SpeechReady || state is SpeechListening) {
      emit(const SpeechListening(""));
      _speechToText.listen(onResult: (SpeechRecognitionResult result) {
        emit(SpeechListening(result.recognizedWords));
      });
    }
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
    emit(SpeechReady());
  }

  void deleteMessage() {
    emit(const SpeechListening(""));
    emit(SpeechReady());
  }

  bool get isListening => _speechToText.isListening;
}
