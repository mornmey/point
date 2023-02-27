import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/api_service.dart';
import 'package:horpao_point/state/accounts/model/account_model.dart';

class AccountRepo with ApiServiceUrlMixin, ApiServiceMixin {
  @override
  String? get token =>
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJrYm1lYW4iLCJpYXQiOjE2NzgzMjcwMTN9.NvWMEKmPKEp359Bhj0U1vzyuCgVV59ZGTDPZVVVcGigJL-9xPQ37AX8Mh3mHcn-iuhs9-JzPWnP-zArpfOcIQw";
  Future<List<AccountModel>> fetchAccountByBranchId(int id) async {
    final resp = await apiGet("$getAccountUrl/$id");
    return resp["data"]
        .map<AccountModel>((e) => AccountModel.fromJson(e))
        .toList();
  }
}

final accountRepository = Provider((ref) => AccountRepo());
