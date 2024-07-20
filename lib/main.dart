import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:thryv/common/theme.dart';
import 'package:thryv/firebase_options.dart';
import 'package:go_router/go_router.dart';
import 'package:thryv/model/user.model.dart';
import 'package:thryv/service/auth.dart';
import 'package:thryv/userProvider.dart';
import 'package:thryv/views/authentication/landing.view.dart';
import 'package:thryv/views/authentication/signin.view.dart';
import 'package:thryv/views/authentication/signup.view.dart';
import 'package:thryv/views/placeholder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Thryv());
}

bool loggedIn(BuildContext context) {
  final user = Provider.of<AuthUser?>(context, listen: false);
  return user != null;
}

String? loggedInRedirect(BuildContext context) {
  if (loggedIn(context)) {
    return "/onboarding1";
  }
  return null;
}

final _router = GoRouter(redirectLimit: 10, initialLocation: '/landing', routes: [
  GoRoute(
    path: '/landing',
    builder: (context, state) => const LandingScreen(),
    redirect: (context, state) => loggedInRedirect(context),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => const ThryvPlaceholder(),
    redirect: (context, state) => '/landing',
  ),
  GoRoute(
    path: '/signUp',
    builder: (context, state) => const SignUp(),
    redirect: (context, state) => loggedInRedirect(context),
  ),
  GoRoute(
    path: '/signIn',
    builder: (context, state) => const SignIn(),
    redirect: (context, state) => loggedInRedirect(context),
  ),
]);

class Thryv extends StatelessWidget {
  const Thryv({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: UserProvider(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          theme: thryvTheme,
        ),
      ),
    );
  }
}
