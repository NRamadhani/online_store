import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/product_detail.dart';
import 'models/product.dart';

// kelas turunan untuk membangun widget yang akan menampilkan informasi tentang suatu produk
class ItemWidget extends StatelessWidget {
  const ItemWidget({ // kelas stateless yang tidak memiliki perubahan internal yang tergantung pada input eksternal
    Key? key, // parameter key yang bertipe key?
    required this.product,
  }) : super(key: key);
  final Product product; // menyimpan objek produk yang akan ditampilkan dalam widget

  @override
  // signature dari metode build
  Widget build(BuildContext context) { // method menerima satu parameter BuildCOntext context yang merupakan objek untuk menyimpan konteks informasi terkait widget
    return GestureDetector( // untuk menambahakan aksi onTap ketika widget ditekan
      onTap: () {
        // untuk berpindah ke halaman baru
        Navigator.push(context, MaterialPageRoute(builder: (context) { // MaterialPageRoute digunakan untuk menntukan rute ke halaman ProductDetail
          // digunakan untuk mengembalikan halaman ProductDetail dengan memberikan objek product sebagai parameter pada  konstruktor ProductDetail
          return ProductDetail(
            product: product,
          );
        }));
      },
      // Cart digunakan untuk membuat sebuah kotak dengan bayangan, latar belakang, dan bentuk yang dapat dikustomisasi
      child: Card( // digunakan sebagai parent widget untuk mengelompokkan elemen di dalamnya
        elevation: 2, // digunakan untuk mengatur elevasi bayangan pada card
        shadowColor: Colors.green, // digunakan untuk mengatur warna bayangan card
        color: Colors.white, // digunakan untuk mengatur warna latar belakang card
        // digunakan untuk mengatur bentuk card dengan memberikan radius bulat pada sudut
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // pada child dari Cart terdapat widget Column yang digunakan untuk mengatur tata letak vertikal dari elemen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hero digunakan untuk memberikan efek tansisi animasi antara gambar produk pada halaman ItemWidget dengan gambar produk pada halaman ProductDetail
            Hero(
              tag: product.images[0],
              child: SizedBox(
                width: 150,
                child: Image.network(product.images[0]),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text( // digunakan untuk menampilkan harga produk
              'USD ${product.price}',
              style: const TextStyle( // digunakan untuk mengatur gaya teks seperti warna, ukuran, dan ketebalan teks
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            // padding digunakan untuk memberikan jarak pada teks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // Divider digunakan untuk membuat garis pemisah antara informasi produk dengan tombol beli dan tambah
            const Divider(
              height: 2,
              color: Colors.grey,
            ),

            const Column( //widget yang berisi tombol beli dan tambah
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row( // digunakan untuk mengelompokkan dua tombol dalam satu baris
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          size: 20,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Beli",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_circle_outline,
                          size: 18,
                          color: Colors.green,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text('0'),
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          size: 18,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
