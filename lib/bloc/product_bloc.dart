import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

// ProductBloc merupakan turunan Bloc untuk menunjukkan ProductBloc akan mengelola event bertipe ProductEvent dan menghasilkan state bertipe ProductState
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) { // konstruktor akan menginisialisasi state awal dengan ProductInitial() menggunakan super
    on<GetProductEvent>((event, emit) async { // method digunakan untuk menangani event GetProductEvent yang diterima oleh ProductBLoc
      emit(ProductLoading());
      final response = await http.get( // aplikasi meminta data produk API yang berasal dari Platzi Fake Store API
        Uri.parse('https://api.escuelajs.co/api/v1/products?offset=0&limit=10'),
        headers: {
          "Content-Type": "application/json",
        },
      );
      // mengirimkan event menggunakan emit untuk mengindikasi bahwa product berhasil diambil dan disertakan di dalam state productsuccess
      emit(ProductSuccess(products: productFromJson(response.body)));
    });
  }
}
