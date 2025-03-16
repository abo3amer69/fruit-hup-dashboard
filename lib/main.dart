import 'package:flutter/material.dart';
import 'package:fruit_hup_dashboard/core/helper_function/on_generate_routes.dart';
import 'package:fruit_hup_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

void main() {
  runApp(const MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: DashboardView.routeName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}