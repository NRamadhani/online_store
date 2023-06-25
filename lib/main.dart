import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grocery_ui/item_widget.dart';
import 'bloc/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // method build digunakan untuk mengembalikan widget yang akan ditampilkan dari kelas
    return BlocProvider(//digunakan sebagai widget injeksi ketergantungan
      // fungis ini akan dipanggil untuk membuat isntance ProductBlock dan kemudian menjalankan event GetProductEvent
      create: (context) => ProductBloc()..add(GetProductEvent()),
      child: MaterialApp( // digunakan untuk menyediakan framework dan konfigurasi dasar aplikasi flutter
        debugShowCheckedModeBanner: false, // digunakan untuk menghilangkan banner debug yang ditampilkan di sudut kanan atas aplikasi
        title: 'Online Store', // digunakan untuk memberikan judul aplikasi
        // digunakan untuk mengatur tema aplikasi
        theme: ThemeData( //
          primarySwatch: Colors.blue, // digunakan untuk menentukan warna utama aplikasi
        ),
        home: const MainPage(), // halaman yang akan ditampilkan saat aplikasi dijalankan
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  // kosntruktor kelas MainPage
  const MainPage({super.key}); // mengacu pada konstruktor kelas iduk yang menerima parameter key

  @override
  // digunakan untuk membuat instance dari state yang terkait dengan MainPage
  State<MainPage> createState() => _MainPageState();
}

// _MainPageState adalah kelas state yang terkait dengan MainPage
class _MainPageState extends State<MainPage> {
  @override
  // method yang akan dipanggil ketika perlu membangun tampilan halaman utama
  Widget build(BuildContext context) {
    return Scaffold( // kerangka dasar halaman utama sepeti AppBar, Drawer, dan lainnya
      appBar: AppBar( // bilah aplikasi halaman utama
        elevation: 1,
        backgroundColor: Colors.white, // warna latar belakang appbar
        // digunakan untuk menambahkan ikon menu di sebelah kiri AppBar
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        // digunakan untuk menampilkan teks judul pada AppBar
        title: const Text(
          'Online Store',
          style: TextStyle(color: Colors.black),
        ),
        // digunakan untuk widget Row yang berisi ikon pencarian dan ikon keranjang
        actions: [
          Row(
            children: [
              const Icon(
                Icons.search, // membuat icon search
                color: Colors.black,
              ),
              // untuk menampilkan idikator jumlah barang di keranjang
              Stack(
                children: [
                  // menujukkan tidankan yang akan dilakukan saat ikon keranjang ditekan
                  IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.shopping_cart, // membuat icon keranjang
                      color: Colors.black,
                    ),
                  ),
                  // digunakan untuk menempatkan indokator jumlah barang di keranjang ke pojok kanan atas ikon keranjang
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Container( // dingunakan untuk membungkus idikator jumlah barang di dalam keranjang dengan bentuk lingkaran
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      // digunakan untuk menampilkan jumlah barang yang ada di keranjang
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      // digunakan untuk membangun tampilan berdasarkan state yang diberikan oleh ProductBloc
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          // jika state saat ini adalah ProductLoading maka akan dikembalikan widget center yang berisi CircularProgressIndocator
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // jika state saat ini adalah ProductSuccess maka akan dikembalikan widget Container yang berisi GridView.builder
          if (state is ProductSuccess) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder( // digunakan untuk menampilkan daftar produk dalam bnetuk grid dengan jumlah kolom sebanyak 2
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return ItemWidget(product: state.products[index]);
                },
                itemCount: state.products.length,
              ),
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
