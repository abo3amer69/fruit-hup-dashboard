import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hup_dashboard/core/errors/failure.dart';
import 'package:fruit_hup_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hup_dashboard/core/services/storage_services.dart';
import 'package:fruit_hup_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageServices storageServices;

  ImagesRepoImpl(this.storageServices);
  @override
  Future<Either<Failure, String>> upLoadImage(File image) async {
    try {
      String url = await storageServices.uploadFile(
        image,
        BackendEndpoint.images,
      );
      return Right(url);
    } catch (e) {
      return left(ServerFailure('Failed to upload image'));
    }
  }
}
