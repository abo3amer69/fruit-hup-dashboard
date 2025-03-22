import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hup_dashboard/core/errors/failure.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> upLoadImage(File image);
}
