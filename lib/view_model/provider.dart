import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/repository/repository.dart';

final repositoryProvider = Provider((ref) => Repository());

final listProvider = ((ref) async {
  final repository = ref.read(repositoryProvider);
  return await repository.fetchList();
});
