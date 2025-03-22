import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hup_dashboard/core/services/storage_services.dart';

class FireStorage implements StorageServices {
  final storageReference = FirebaseStorage.instance;
  @override
  Future<String> uploadFile(String image) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
