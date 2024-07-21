import "package:flutter/material.dart";
import "package:thryv/service/auth.dart";

class ThryvPlaceholder extends StatelessWidget {
  const ThryvPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          child: const Text("This hasn't been built yet"),
          onPressed: () => AuthService().signOut(),
        ),
      ),
    );
  }
}
