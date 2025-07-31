import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iti_flutter/core/errors/fauilers.dart';
import 'package:iti_flutter/core/utils/apis_services.dart';
import 'package:iti_flutter/features/Home%20feature/data/models/book_model/book.model.dart';
import 'package:iti_flutter/features/Home%20feature/data/repos/home_repo.dart';

class HomeRepoImplent implements HomeRepo {
  final ApisServices apisServices;

  HomeRepoImplent({required this.apisServices});
  @override
  Future<Either<Fauilers, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apisServices.get(
        endpoint: 'volumes?q=Computer Science&filtering=free-ebooks',
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromResponse(item));
        print(BookModel.fromResponse(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFauilre.DioException(e));
      } else {
        return left(ServerFauilre(e.toString()));
      }
    }
  }

  @override
  Future<Either<Fauilers, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apisServices.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:Programming',
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromResponse(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFauilre.DioException(e));
      } else {
        return left(ServerFauilre(e.toString()));
      }
    }
  }
  // fetchSimilarBooks

  @override
  Future<Either<Fauilers, List<BookModel>>> fetchSimilarBooks({
    required String? catagory,
  }) async {
    try {
      var data = await apisServices.get(
        endpoint: 'volumes?q=$catagory&filtering=free-ebooks&Sorting=relevance',
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromResponse(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFauilre.DioException(e));
      } else {
        return left(ServerFauilre(e.toString()));
      }
    }
  }
}
