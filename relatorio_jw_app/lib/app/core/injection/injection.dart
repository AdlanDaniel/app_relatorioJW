import 'package:get/get.dart';

class Injection {
  static T registerSingleton<T>(
    T dependency, {
    String? tag,
    bool permanent = false,
    T Function()? builder,
  }) =>
      Get.put(dependency, tag: tag, permanent: permanent, builder: builder);

  static void lazySingleton<T>(
    T Function() builder, {
    String? tag,
    bool fenix = false,
  }) {
    Get.lazyPut(builder, tag: tag, fenix: fenix);
  }

  static T get<T>({String? tag}) => Get.find<T>(tag: tag);

  static void reset({
    bool clearFactory = true,
    bool clearRouteBindings = true,
  }) {
    Get.reset(
        clearFactory: clearFactory, clearRouteBindings: clearRouteBindings);
  }

  static bool isRegistered<T>({String? tag}) => Get.isRegistered<T>(tag: tag);

  static Future<bool> delete<T>({String? tag, bool force = false}) async =>
      await Get.delete<T>(tag: tag, force: force);
}
