import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/injection/app_root_dependency.dart';

import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/pages/browse_view.dart';

class AppBrowseInitial extends StatelessWidget {
  final String? category;
  final String? keyword;

  const AppBrowseInitial({super.key, this.category, this.keyword});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = sl<BrowseBloc>();

        final hasCategory = category?.isNotEmpty ?? false;
        final hasKeyword = keyword?.isNotEmpty ?? false;

        if (hasCategory || hasKeyword) {
          bloc.add(BrowseFilterEvent(category, keyword));
        } else {
          bloc.add(BrowseFetchEvent());
        }

        return bloc;
      },
      child: BrowseView(),
    );
  }
}
