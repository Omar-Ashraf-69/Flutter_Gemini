part of 'gemini_cubit_cubit.dart';

@immutable
sealed class GeminiState {}

final class GeminiInitial extends GeminiState {}

final class GeminiLoading extends GeminiState {}

final class GeminiSuccess extends GeminiState {}

final class GeminiFaliure extends GeminiState {}
