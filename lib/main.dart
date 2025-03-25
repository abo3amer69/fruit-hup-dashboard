import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup_dashboard/core/helper_function/on_generate_routes.dart';
import 'package:fruit_hup_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruit_hup_dashboard/core/services/get_it_services.dart';
import 'package:fruit_hup_dashboard/core/services/supabase_storage_services.dart';
import 'package:fruit_hup_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruit_hup_dashboard/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageServices.initSupabase();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetit();
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
