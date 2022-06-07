import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/features/users/controller/user_controller.dart';

class UserDetailsPage extends ConsumerWidget {
  UserDetailsPage({Key? key, required this.id}) : super(key: key);
  int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDetailsNotifierProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Container(
        child: data.when(
          data: (d) {
            return Column(
              children: [
                Text(d.id.toString()),
                Text(d.email),
                Text(d.lastName),
                Text(d.email),
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
