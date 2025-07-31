
import 'package:dartz/dartz.dart';
import 'package:iti_flutter/core/errors/fauilers.dart';
import 'package:iti_flutter/features/Home%20feature/data/models/book_model/book.model.dart';

abstract class HomeRepo // Reposity pattern to create abstract class
{
  Future<Either<Fauilers, List<BookModel>>> fetchNewestBooks();
  Future<Either<Fauilers, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Fauilers, List<BookModel>>> fetchSimilarBooks({required String ? catagory});

}
