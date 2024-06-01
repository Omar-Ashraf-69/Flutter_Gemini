import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gemini/core/utils/api_keys.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:meta/meta.dart';

part 'gemini_cubit_state.dart';

class GeminiCubit extends Cubit<GeminiState> {
  GeminiCubit() : super(GeminiInitial());
  List<Map<String, String>> messHistory = [];
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  String message = '';
  Future<void> chat({required String message}) async {
    emit(GeminiLoading());
    // Access your API key as an environment variable (see "Set up your API key" above)
    final apiKey = ApiKeys.geminiApiKey;
    // The Gemini 1.5 models are versatile and work with multi-turn conversations (like chat)
    final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
        generationConfig: GenerationConfig(maxOutputTokens: 1000));
    // Initialize the chat
    final chat = model.startChat(
      history: messHistory
          .map(
            (e) => e['role'] == 'CHATBOT'
                ? Content.model([TextPart(e['message']!)])
                : Content.text(e['message']!),
          )
          .toList(),
      //[
      // Content.text('Hello, I have 2 dogs in my house.'),
      // Content.model(
      //     [TextPart('Great to meet you. What would you like to know?')])
      // ]
    );
    var content = Content.text(message);
    // final response = chat.sendMessageStream(content);
    var response = await chat.sendMessage(content);
    if (response.text != null) {
      messHistory.add({'role': 'CHATBOT', 'message': response.text!});
      emit(GeminiSuccess());
    } else {
      emit(GeminiFaliure());
    }
  }
}
