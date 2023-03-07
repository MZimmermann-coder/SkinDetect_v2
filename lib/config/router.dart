import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skindetect/screens/cancer_type_detail_page.dart';
import 'package:skindetect/screens/diagnose_history_page.dart';
import 'package:skindetect/screens/diagnose_page.dart';
import 'package:skindetect/screens/faq_page.dart';
import 'package:skindetect/screens/home_page.dart';
import 'package:skindetect/screens/history_page.dart';
import 'package:skindetect/screens/home_warning_page.dart';
import 'package:skindetect/screens/question_detail_page.dart';
import '../components/scaffold_with_nav.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _nakiRouter = GoRouter(
  initialLocation: "/home",
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNav(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/home',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return NoTransitionPage(key: state.pageKey, child: HomePage());
            },
            routes: [
              GoRoute(
                  path: "warning",
                  pageBuilder: (context, state) {
                    return CustomTransitionPage<void>(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: HomeWarningPage(),
                      transitionDuration: Duration(milliseconds: 400),
                      transitionsBuilder: slideTransitionBuilder,
                    );
                  }),
              GoRoute(
                  path: "diagnose",
                  pageBuilder: (context, state) {
                    return CustomTransitionPage<void>(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: DiagnosePage(),
                      transitionDuration: Duration(milliseconds: 400),
                      transitionsBuilder: slideTransitionBuilder,
                    );
                  }),
            ]),
        GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/faq',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return NoTransitionPage(key: state.pageKey, child: FaqPage());
            },
            routes: [
              GoRoute(
                  path: "q/:questionId",
                  pageBuilder: (context, state) {
                    return CustomTransitionPage<void>(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: QuesitonDetailPage(
                          questionId: state.params["questionId"]!),
                      transitionDuration: Duration(milliseconds: 400),
                      transitionsBuilder: slideTransitionBuilder,
                    );
                  }),
              GoRoute(
                  path: "ct/:cancerTypeId",
                  pageBuilder: (context, state) {
                    return CustomTransitionPage<void>(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: CancerTypeDetailPage(
                          cancerTypeId: state.params["cancerTypeId"]!),
                      transitionDuration: Duration(milliseconds: 400),
                      transitionsBuilder: slideTransitionBuilder,
                    );
                  }),
            ]),
        GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/history',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return NoTransitionPage(key: state.pageKey, child: HistoryPage());
            },
            routes: [
              GoRoute(
                  path: "scan/:scanId",
                  pageBuilder: (context, state) {
                    return CustomTransitionPage<void>(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child:
                          DiagnoseHistoryPage(scanId: state.params["scanId"]!),
                      transitionDuration: Duration(milliseconds: 400),
                      transitionsBuilder: slideTransitionBuilder,
                    );
                  }),
            ]),
      ],
    ),
  ],
);

get nakiRouter => _nakiRouter;

Widget slideTransitionBuilder(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const begin = Offset(1.0, 0);
  const end = Offset.zero;
  const curve = Curves.easeOutQuart;

  final tween = Tween(begin: begin, end: end);
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );

  return SlideTransition(
    position: tween.animate(curvedAnimation),
    child: child,
  );
}
