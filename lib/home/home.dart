import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/features/users/controller/user_controller.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userNotifierProvider);
    return Scaffold(
      body: ListView(
        children: [
          data.when(
              data: (d) {
                return Column(
                  children: [
                    ...d.map((e) => ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(e.avatar)),
                        ))
                  ],
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
