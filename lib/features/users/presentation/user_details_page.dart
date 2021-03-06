import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/features/users/controller/user_controller.dart';

// ignore: must_be_immutable
class UserDetailsPage extends ConsumerWidget {
  UserDetailsPage({Key? key, required this.id}) : super(key: key);
  int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDetailStateNotifierProvider(id));
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(userDetailStateNotifierProvider(id)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details Page'),
        ),
        body: Container(
          child: data.when(
            data: (d) {
              return Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your ID is ${d.id}"),
                    Text("Email is ${d.email}"),
                    Text("First Name is ${d.firstNAme}"),
                    Text("Last Name is ${d.lastName}"),
                  ],
                ),
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
