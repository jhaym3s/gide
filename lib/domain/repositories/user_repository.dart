// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/features/dashboard/profile/profile/profile.dart';

abstract class UserRepository {
  void saveToken(String val);
  String getToken();
  CurrentState getCurrentState();
  void saveCurrentState(CurrentState val);
  bool hasClearedCache();
  void saveCacheStatus(bool status);
  void saveProfile(Profile profile);
  void setCurrentProfile(Profile profile);
  Profile getProfile();
}
