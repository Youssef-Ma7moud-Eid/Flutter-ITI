import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_flutter/features/Home%20feature/data/models/book_model/book.model.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/manager/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/manager/newest%20books%20cubit/newest_books_state.dart';
import 'package:shimmer/shimmer.dart';

class NewBookViewBody extends StatefulWidget {
  const NewBookViewBody({super.key});

  @override
  State<NewBookViewBody> createState() => _NewBookViewBodyState();
}

class _NewBookViewBodyState extends State<NewBookViewBody> {
  @override
  void initState() {
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<NewestBooksCubit, NewestBooksCubitState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 15),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    child: FadeInRight(
                      duration: const Duration(milliseconds: 900),
                      delay: Duration(milliseconds: index * 210),
                      child: NewestSellerFeatureItem(
                        bookModel: state.books[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomError(error: state.errormessage),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10, // Number of shimmer items
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    child: ShimmerLoadingItem(),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class NewestSellerFeatureItem extends StatelessWidget {
  const NewestSellerFeatureItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 0.88,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    bookModel.volumeInfo.imageLinks?.thumbnail ??
                    'http://books.google.com/books/content?id=7m9FAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/test_image.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.075),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel.volumeInfo.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.004),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(bookModel.volumeInfo.authors?[0] ?? 'Mark')],
                ),
                Expanded(flex: 2, child: SizedBox()),

                Row(
                  children: [
                    Text('Free'),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    // Spacer(),
                    BookRating(
                      bookRating: bookModel.volumeInfo.averageRating ?? 0,
                      count: bookModel.volumeInfo.ratingsCount ?? 0,
                    ),
                  ],
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.bookRating, required this.count});
  final num bookRating;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Color(0XFFFFDD4D), size: 17),
        SizedBox(width: 4),
        Text(bookRating.toString()),
        Opacity(opacity: 0.5, child: Text(' ($count)')),
      ],
    );
  }
}

class ShimmerLoadingItem extends StatelessWidget {
  const ShimmerLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.21,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 0.68,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[600]!, // Darker base color
              highlightColor: const Color.fromARGB(11, 236, 230, 230),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(220, 224, 224, 224),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // color: const Color.fromARGB(220, 224, 224, 224),
          SizedBox(width: MediaQuery.of(context).size.width * 0.075),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[600]!, // Darker base color
                  highlightColor:
                      Colors.yellowAccent, // Brighter highlight color
                  child: Container(
                    height: 20,
                    width: double.infinity,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.yellowAccent,
                      child: Container(
                        height: 16,
                        width: 100,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.yellowAccent,
                      child: Container(
                        height: 16,
                        width: 80,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.yellowAccent,
                      child: Container(
                        height: 20,
                        width: 50,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.yellowAccent,
                      child: Container(
                        height: 20,
                        width: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(error),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog or widget
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
