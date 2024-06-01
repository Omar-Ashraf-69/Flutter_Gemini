import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/core/managers/speech_cubit/speech_cubit.dart';
import 'package:gemini/features/home/presentation/views/home_view.dart';

Timer navigationTimer(BuildContext context) {
  return Timer(const Duration(seconds: 2), () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SpeechCubit()..initialize(),
                  child: const HomeView(),
                )));
  });
}
