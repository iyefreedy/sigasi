import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/domain/models/post/post.dart';
import '../../../resident/notifiers/resident_list_notifier.dart';

@RoutePage()
class PostFormScreen extends ConsumerWidget {
  const PostFormScreen({super.key, this.post});

  final Post? post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentList = ref.watch(residentListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Posko'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: HookBuilder(builder: (context) {
              final state = useState(post ?? const Post());

              return ListView(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lokasi',
                    ),
                    initialValue: state.value.location,
                    onChanged: (value) {
                      state.value = state.value.copyWith(location: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Masalah',
                    ),
                    initialValue: state.value.issue,
                    onChanged: (value) {
                      state.value = state.value.copyWith(issue: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Solusi',
                    ),
                    initialValue: state.value.solution,
                    onChanged: (value) {
                      state.value = state.value.copyWith(solution: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<int>(
                    items: residentList.maybeWhen(
                      orElse: () => [],
                      data: (data) => data
                          .map(
                            (resident) => DropdownMenuItem(
                              value: resident.id,
                              child: Text('${resident.name}'),
                            ),
                          )
                          .toList(),
                    ),
                    onChanged: (value) {
                      state.value = state.value.copyWith(residentId: value);
                    },
                    value: state.value.residentId,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Simpan'),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
