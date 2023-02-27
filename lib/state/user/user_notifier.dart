import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horpao_point/model/models.dart';

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier() : super([]);

  void createUser(User user) {
    state = [...state, user];
    print("Create user: $user");
  }

  void updateUser(int userID) {
    state = [
      for (final user in state)
        if (user.id == userID)
          user.copyWith(
              id: user.id,
              name: user.name,
              nameKh: user.nameKh,
              primaryPhone: user.primaryPhone,
              secondPhone: user.secondPhone,
              password: user.password,
              dateOfBirth: user.dateOfBirth,
              sex: user.sex)
        else
          user,
    ];
  }
}
