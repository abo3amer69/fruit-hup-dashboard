import 'package:flutter/material.dart';
import 'package:fruit_hup_dashboard/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const routeName = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardViewBody(),
    );
  }
}