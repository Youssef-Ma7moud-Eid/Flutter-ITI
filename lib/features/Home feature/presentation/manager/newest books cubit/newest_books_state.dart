

import 'package:iti_flutter/features/Home%20feature/data/models/book_model/book.model.dart';

abstract class NewestBooksCubitState  {
  

}

class NewestBooksInitial extends NewestBooksCubitState {}

class NewestBooksLoading extends NewestBooksCubitState {}

class NewestBooksSuccess extends NewestBooksCubitState {
  final List<BookModel> books;

   NewestBooksSuccess({required this.books});
}

class NewestBooksFailure extends NewestBooksCubitState {
  final String errormessage;

   NewestBooksFailure({required this.errormessage});
}
