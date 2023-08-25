import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/main/view/main_view.dart';
import '../../features/main/view/pay_view.dart';

final routerProvider = Provider<GoRouter>(
      (ref) {
    return GoRouter(
      initialLocation: PayView.routeName,
      routes: [
        GoRoute(
          path: MainView.routeName,
          builder: (context, state) => const MainView(),
        ),
        GoRoute(
          path: PayView.routeName,
          builder: (context, state) => const PayView(),
        ),
      ],
    );
  },
);
