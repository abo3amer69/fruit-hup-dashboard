import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hup_dashboard/core/errors/failure.dart';
import 'package:fruit_hup_dashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo{
  @override
  Future<Either<Failure, String>> upLoadImage(File image) {
    // TODO: implement upLoadImage
    throw UnimplementedError();
  }
}