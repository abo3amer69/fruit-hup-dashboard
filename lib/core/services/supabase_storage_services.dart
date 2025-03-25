import 'dart:io';

import 'package:fruit_hup_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageServices implements StorageServices {
  static late Supabase _supabase;

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://fglezhmlkpronldzdsso.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZnbGV6aG1sa3Byb25sZHpkc3NvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4NDM4NDcsImV4cCI6MjA1ODQxOTg0N30.ti1dH2MZQVayvheUN30W8HDAhOFn1qDqRcAbeWHx-0A',
    );
  }

  @override
  Future<String> uploadFile(File file, String path) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
