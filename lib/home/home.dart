import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/features/users/controller/user_controller.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getUserProvider);
    return Scaffold(
      body: ListView(
        children: [
          data.when(
              data: (d) {
                return d.fold(
                  (l) => Text(l.message),
                  (r) {
                    return Column(
                      children: [
                        ...r.map(
                          (e) => ListTile(
                            title: Text(e.firstNAme),
                            leading: Image.network(e.avatar),
                            subtitle: Text(e.lastName),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => const CircularProgressIndicator()),
        ],
      ),
    );
  }
}
