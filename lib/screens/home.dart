import 'package:dictionary/bloc/cubit/dictionary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Spacer(),
          const Text(
            'Dictionary',
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 34),
          ),
          const Text(
            'Search any word ypu want to quickly',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 32,
          ),
          TextField(
              controller: cubit.querryController,
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: 'Search a Word.',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  fillColor: Colors.grey[100],
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintStyle: const TextStyle(color: Colors.black))),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getWordSearched();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                padding: const EdgeInsets.all(16),
              ),
              child: const Text('SEARCH'),
            ),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: getDictionaryFormWidget(context));
  }
}
