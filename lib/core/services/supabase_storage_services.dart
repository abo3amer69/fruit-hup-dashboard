import 'dart:io';

import 'package:fruit_hup_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageServices implements StorageServices {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    await _supabase.client.storage.createBucket(bucketName);
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://fglezhmlkpronldzdsso.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZnbGV6aG1sa3Byb25sZHpkc3NvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0Mjg0Mzg0NywiZXhwIjoyMDU4NDE5ODQ3fQ.WCPSnkgxR2fnuT0GX8w2rh4p75ays5lcWFvFq5eB5zI',
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);

    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', file);
    return result;
  }
}
