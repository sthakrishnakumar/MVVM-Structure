import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/features/users/controller/user_controller.dart';
import 'package:new_structure_learning/features/users/presentation/user_details_page.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataNotifierProvider);
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(userDataNotifierProvider),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: ListView(
          children: [
            data.when(
                data: (d) {
                  return Column(
                    children: [
                      ...d.map(
                        (e) => InkWell(
                          onTap: () {
                            log('hello');
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => UserDetailsPage(id: e.id),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(e.avatar),
                            ),
                            title: Text("${e.firstNAme} ${e.lastName}"),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                error: (err, s) => Text(err.toString()),
                loading: () =>
                    const Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
