import 'package:auto_route/auto_route.dart';
import '../../modules/profile/views/profile_view.dart';
import '../../modules/profile/views/sunush_pikirler_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page Route',
  routes: <AutoRoute>[
    AutoRoute(path: 'profileVIew', page: ProfileView, initial: true),
    AutoRoute(path: 'sunushPikirler', page: SunushPikirlerPage),
  ],
)
class $AppRouter {}
