import 'package:go_router/go_router.dart';
import '../presentation/models/projects_info.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/privacy_policy.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/privacy_policy/:name', // ✅ Dynamic route parameter
      builder: (context, state) {
        final policyData = state.extra as PrivacyPolicyData?;
        return PrivacyPolicy(
          title: policyData?.title,
          icon: policyData?.image,
          color: policyData?.color,
          description: policyData?.description,
        );
      },
    ),
  ],
);