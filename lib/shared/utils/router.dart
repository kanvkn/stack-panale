import 'package:go_router/go_router.dart';
import '../../features/setup/presentation/setup_screen.dart';
import '../../features/setup/presentation/termux_setup_screen.dart';
import '../../features/setup/presentation/ssh_setup_screen.dart';
import '../../features/setup/presentation/local_setup_screen.dart';
import '../../features/ide/presentation/ide_screen.dart';
import '../../features/nexor/presentation/nexor_screen.dart';
import '../../features/nexi/presentation/nexi_marketplace.dart';
import '../widgets/settings_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/setup',
    routes: [
      GoRoute(
        path: '/setup',
        name: 'setup',
        builder: (context, state) => const SetupScreen(),
      ),
      GoRoute(
        path: '/setup/termux',
        name: 'termux-setup',
        builder: (context, state) => const TermuxSetupScreen(),
      ),
      GoRoute(
        path: '/setup/ssh',
        name: 'ssh-setup',
        builder: (context, state) => const SSHSetupScreen(),
      ),
      GoRoute(
        path: '/setup/local',
        name: 'local-setup',
        builder: (context, state) => const LocalSetupScreen(),
      ),
      GoRoute(
        path: '/ide',
        name: 'ide',
        builder: (context, state) => const IDEScreen(),
      ),
      GoRoute(
        path: '/nexor',
        name: 'nexor',
        builder: (context, state) => const NexorScreen(),
      ),
      GoRoute(
        path: '/nexi',
        name: 'nexi',
        builder: (context, state) => const NexiMarketplace(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
