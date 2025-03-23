import 'package:bloc/bloc.dart';
import 'package:fruit_hup_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hup_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hup_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.upLoadImage(addProductInputEntity.image);
    result.fold(
      (f) {
        emit(AddProductFailure(f.message));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);

        result.fold(
          (f) {
            emit(AddProductFailure(f.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
