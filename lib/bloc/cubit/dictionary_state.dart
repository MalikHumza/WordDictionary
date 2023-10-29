part of 'dictionary_cubit.dart';

@immutable
abstract class DictionaryState {}

final class DictionaryInitial extends DictionaryState {}

final class DictionarySearching extends DictionaryState {}

final class DictionarySearched extends DictionaryState {
  final List<WordResponse> words;
  DictionarySearched(this.words);
}

final class DictionaryError extends DictionaryState {
  final message;
  DictionaryError(this.message);
}
