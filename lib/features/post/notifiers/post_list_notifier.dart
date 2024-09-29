import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/models/post/post.dart';

part 'post_list_notifier.g.dart';

@riverpod
class PostListNotifier extends _$PostListNotifier {
  @override
  Future<List<Post>> build() async {
    throw UnimplementedError();
  }
}
