import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/state/accounts/model/account_model.dart';

class AccountNotifier extends StateNotifier<AccountModel> {
  AccountNotifier() : super(const AccountModel());
}
