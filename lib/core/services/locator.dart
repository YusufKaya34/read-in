import 'package:get_it/get_it.dart';
import 'package:read_in/core/repository/user_repository.dart';
import 'package:read_in/core/services/fake_auth_services.dart';
import 'package:read_in/core/services/firebase_auth_service.dart';
import 'package:read_in/core/services/firestore_db_service.dart';



GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FirestoreDBService());

}
