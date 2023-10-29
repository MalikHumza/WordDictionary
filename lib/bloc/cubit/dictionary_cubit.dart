import 'package:bloc/bloc.dart';
import 'package:dictionary/model/word_response.dart';
import 'package:dictionary/repo/word_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;
  DictionaryCubit(this._repository) : super(DictionaryInitial());

  final querryController = TextEditingController();
  Future getWordSearched() async {
    emit(DictionaryInitial());
    try {
      final words =
          await _repository.getWordsFromDictionary(querryController.toString());
      if (words == null) {
        emit(DictionaryError('Words cannot be emmpty'));
      } else {
        DictionarySearched(words);
      }
    } on Exception catch (e) {
      print(e);
      emit(DictionaryError(e.toString()));
    }
  }
}
