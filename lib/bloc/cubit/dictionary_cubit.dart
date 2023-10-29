import 'package:bloc/bloc.dart';
import 'package:dictionary/model/word_response.dart';
import 'package:dictionary/repo/word_repo.dart';
import 'package:flutter/material.dart';
part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;
  DictionaryCubit(this._repository) : super(DictionaryInitial());

  final querryController = TextEditingController();
  Future getWordSearched() async {
    emit(DictionarySearching());
    try {
      final words =
          await _repository.getWordsFromDictionary(querryController.text);
      if (words == null) {
        emit(DictionaryError('Words cannot be emmpty'));
      } else {
        print('These are words $words');
        emit(DictionarySearched(words));
        emit(DictionaryInitial());
      }
    } on Exception catch (e) {
      print(e);
      emit(DictionaryError(e.toString()));
    }
  }
}
