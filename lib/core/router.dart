import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/privacy_policy.dart';
import '../presentation/providers/website_info_provider.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/privacypolicy',
        builder: (context, state) => const PrivacyPolicy()),
    GoRoute(
      path: '/privacypolicy/:name',
      builder: (context, state) {
        final name = state.pathParameters['name'];
        var privacyPolicy =
            Provider.of<WebsiteInfoProvider>(context, listen: false)
                .fetchPrivacyData(name!);
        return PrivacyPolicy(
          title: privacyPolicy?.title,
          icon: privacyPolicy?.image,
          color: privacyPolicy?.color,
          description: privacyPolicy?.description,
        );
      },
    ),
  ],
);
