import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/privacy_policy.dart';
import '../presentation/providers/website_info_provider.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    // navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/privacypolicy',
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return TurnPageTransition(
              animation: animation,
              overleafColor:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
              child: child,
            );
          },
          child: const PrivacyPolicy(),
        ),
      ),
      GoRoute(
        path: '/privacypolicy/:name',
        pageBuilder: (context, state) {
          final name = state.pathParameters['name'];
          final websiteInfoProvider =
              Provider.of<WebsiteInfoProvider>(context, listen: false);
          final privacyPolicy = websiteInfoProvider.fetchPrivacyData(name!);
          return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 800),
              reverseTransitionDuration: const Duration(milliseconds: 600),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return TurnPageTransition(
                  animation: animation,
                  overleafColor: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.8),
                  child: child,
                );
              },
              child: PrivacyPolicy(
                title: privacyPolicy?.title,
                icon: privacyPolicy?.image,
                color: privacyPolicy?.color,
                description: privacyPolicy?.description,
              ));
        },
      ),
    ],
  );
}
