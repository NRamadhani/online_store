import 'package:flutter/material.dart';
import 'models/product.dart';

class ProductDetail extends StatefulWidget {
  // konstruktor dari kelas ProductDetail
  const ProductDetail({
    Key? key, // digunakan untuk memberikan kunci unik kepada widget
    required this.product, // digunakan untuk menerima product yang akan ditampilkan pada halaman detail
  }) : super(key: key);

  final Product product;

  @override
  // method yang mengembalikan state baru untuk widget ProductDetail
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int count = 1; // mendeklarasikan variabel count dengan nilai awal 1

  // method untuk menambah nilai count sebanyak 1 ketika tombol penambahan ditekan
  void addCount() {
    count = count + 1;
    setState(() {});
  }

  // method untuk mengurangi nilai count sebanyak 1 ketika tombol pengurangan ditekan
  void removeCount() {
    if (count != 0) {
      count = count - 1;
      setState(() {}); // digunakan untuk memberitahu framework flutter bahwa terjadi perubahan pada state dan perlu dilakukan perubahan tampilan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // widget utama yang menyediakan kerangka tampilan halaman
      appBar: AppBar( // bagian atas halaman yang berisi judul, ikon kembali, dan ikon favorit
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton( // digunakan untuk kembali kehalaman sebelumnya saat ditekan
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text( // teks Detail ditampilkan sebagai judul AppBar
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.product.title,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Center(
            child: Hero(
              tag: widget.product.images[0],
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45, // menentukan tinggi
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.product.images[0]), // menampilkan gambar
                        fit: BoxFit.contain)),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Text(
                  'USD ${widget.product.price}',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  ' /${widget.product.price}',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.product.description,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.bottomCenter,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: removeCount,
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                        onPressed: addCount,
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: 190,
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        color: Colors.green),
                    child: const Center(
                      child: Text(
                        "Pesan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
