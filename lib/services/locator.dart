import 'package:get_it/get_it.dart';
import 'package:portal/services/firebase_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //locator.registerLazySingleton(() => Auth());

  locator.registerFactory(() => FirebaseServices());
  //locator.registerFactory(() => HomeModel());
}
