import 'package:dictionary/bloc/cubit/dictionary_cubit.dart';
import 'package:dictionary/repo/word_repo.dart';
import 'package:dictionary/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(Dictionary());
}

class Dictionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary',
      home: BlocProvider(
        child: Home(),
        create: (context) => DictionaryCubit(WordRepository()),
      ),
    );
  }
}
