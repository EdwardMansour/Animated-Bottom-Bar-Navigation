import 'package:estatetial_interm_test/core/navigator_service/navigator_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
//!--Edward Mansour 08-10-2020
void init() {
  //!-Navigator Service
  locator.registerLazySingleton(
    () => NavigationService(),
  );
}
