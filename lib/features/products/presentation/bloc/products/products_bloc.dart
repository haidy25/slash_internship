// part of 'products_event.dart';
// part of 'products_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:slash_internship/core/error/failure.dart';
import 'package:slash_internship/features/products/domain/entities/product.dart';
import 'package:slash_internship/features/products/domain/entities/product_variations.dart';
import 'package:slash_internship/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:slash_internship/features/products/domain/usecases/get_product_details_usecase.dart';
import 'package:slash_internship/features/products/presentation/bloc/products/products_event.dart';
import 'package:slash_internship/features/products/presentation/bloc/products/products_state.dart';
import '../../../../../core/strings/failures.dart';

class ProductBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetProductDetailsUsecase getProductDetailsUsecase;

  ProductBloc(super.initialState,
      {required this.getAllProductsUsecase,
      required this.getProductDetailsUsecase}) {
    on<ProductsEvent>(event, emit) async {
      if (event is GetAllProductsEvent) {
        emit(LoadingProductState());
        final failureOrProducts = await getAllProductsUsecase.call();
        emit(_mapFailureOrProductsToState(failureOrProducts));
      } else if (event is RefreshProductsEvent) {
        final failureOrProducts = await getAllProductsUsecase.call();
        emit(_mapFailureOrProductsToState(failureOrProducts));
      } else if (event is GetProductDetailsEvent) {
        emit(LoadingProductDetailsState());
        Either<Failure, List<ProductVariations>> response =
            (await getProductDetailsUsecase.call(event.productId))
                as Either<Failure, List<ProductVariations>>;
        response.fold(
            (failure) => ErrorProductsDetailsState(
                message: _mapFailureToMessage(failure)),
            (productdetails) =>
                LoadedProductsDetailsState(productDetails: productdetails));
      }
    }
  }

  ProductsState _mapFailureOrProductsToState(
      Either<Failure, List<Product>> either) {
    return either.fold(
        (failure) => ErrorProductsState(message: _mapFailureToMessage(failure)),
        (products) => LoadedProductsState(products: products));
  }

  //to know what type of failue returned
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
