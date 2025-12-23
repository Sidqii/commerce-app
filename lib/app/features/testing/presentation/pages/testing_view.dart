import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/testing/presentation/bloc/testing_bloc.dart';
import 'package:suaka_niaga/app/features/testing/presentation/bloc/testing_state.dart';

class TestingView extends StatelessWidget {
  const TestingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<TestingBloc, TestingState>(
                builder: (context, state) {
                  if (state is TestingLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is TestingLoadedState) {
                    final content = state.testEntity;

                    final counter = content.map((e) => e.title).toList();

                    return ListView.builder(
                      itemCount: counter.length,
                      itemBuilder: (context, index) {
                        final item = content[index];

                        return ListTile(title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('id: ${item.id}'),
                            Text('rating: ${item.rating}'),
                            Text('name: ${item.title}'),
                            Text('price: ${item.price}'),
                            Text('desc: ${item.description}'),
                            Text('stocks: ${item.stocks}'),
                          ],
                        ));
                      },
                    );
                  }

                  if (state is TestingErrorState) {
                    return Center(child: Text(state.error));
                  }

                  return const Center(child: Text('404 not found'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
