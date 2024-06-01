part of 'speech_cubit.dart';

abstract class SpeechState {
  const SpeechState();
}

class SpeechInitial extends SpeechState {}

class SpeechReady extends SpeechState {}

class SpeechListening extends SpeechState {
  final String recognizedWords;

  const SpeechListening(this.recognizedWords);

  List<Object> get props => [recognizedWords];
}

class SpeechError extends SpeechState {
  final String message;

  const SpeechError(this.message);

  List<Object> get props => [message];
}
