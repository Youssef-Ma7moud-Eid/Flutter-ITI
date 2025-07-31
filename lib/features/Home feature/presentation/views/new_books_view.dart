import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/core/utils/apis_services.dart';
import 'package:iti_flutter/features/Home%20feature/data/repos/home_repo_implent.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/manager/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/widgets/new_books_view_body.dart';

class NewBooksView extends StatelessWidget {
  const NewBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => NewestBooksCubit(HomeRepoImplent(apisServices: ApisServices(Dio()))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Books',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 15)),
            NewBookViewBody(),
          ],
        ),
      ),
    );
  }
}
