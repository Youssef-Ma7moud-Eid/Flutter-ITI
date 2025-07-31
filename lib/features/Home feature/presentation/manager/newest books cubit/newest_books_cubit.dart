import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/features/Home%20feature/data/repos/home_repo.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/manager/newest%20books%20cubit/newest_books_state.dart';


class NewestBooksCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
        (failure) => emit(NewestBooksFailure(errormessage: failure.errMessage)),
        (featuredbooks) => emit(NewestBooksSuccess(books: featuredbooks)));
  }
}
