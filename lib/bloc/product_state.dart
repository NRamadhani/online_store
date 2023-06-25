part of 'product_bloc.dart';
// ProductState merupakan kelas abstrak yang digunakan untuk mewakili state dari produk dalam aplikasi
abstract class ProductState {}
// kelas turunan yang mewakili state awal dari produk dalam aplikasi
class ProductInitial extends ProductState {}
// kelas turunan yang mewakili state ketika aplikasi sedang memuat atau mengambil data produk
class ProductLoading extends ProductState {}
// kelas turunan yang mewakili state ketika aplikasi berhasil memuat data produk
class ProductSuccess extends ProductState {
  final List<Product> products; // properti yang menunjukkan daftar produk yang berhasil diambil
  ProductSuccess({
    required this.products,
  });
}
