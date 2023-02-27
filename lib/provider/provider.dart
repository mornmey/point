import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/model/models.dart';
import 'package:horpao_point/repository/account_repo.dart';
import 'package:horpao_point/state/user/user_notifier.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, List<User>>((ref) => UserNotifier());

/// Fetch Account
final fetchAccountByBranchId = FutureProvider.family((ref, int branchId) async {
  final accountRepo = ref.watch(accountRepository);
  final result = await accountRepo.fetchAccountByBranchId(branchId);
  return result;
});
