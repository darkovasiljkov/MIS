import 'package:flutter/material.dart';
import 'package:laboratories_mis/models/ClothingItems.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: ClothingStorePage(),
    );
  }
}
class ClothingStorePage extends StatelessWidget {
  ClothingStorePage({super.key});

  final List<ClothingItem> clothingItems=[
    ClothingItem(
        name: "Polo T-Shirt Blue",
        image: "https://m.media-amazon.com/images/I/81NahZXF9QL._AC_SL1396_.jpg",
        description: "Navy Blue Polo T-Shirt Summer",
        price: 55.00
    ),
    ClothingItem(
        name: "Polo Shirt",
        image: "https://www.careofcarl.com/bilder/artiklar/600x600_grey_4_5/16614411r.jpg",
        description: "White Polo Shirt",
        price: 80.00),
    ClothingItem(
        name: "Polo Shoes",
        image: "https://www.optimized-rlmedia.io/is/image/PoloGSI/s7-AI809949791002_lifestyle?",
        description: "Casual & Formal Polo Shoes",
        price: 110.00),
    ClothingItem(
        name: "Polo T-Shirt White",
        image: "https://cdn.mainlinemenswear.co.uk/f_auto,q_auto/mainlinemenswear/shopimages/products/158368/Mainimage.jpg",
        description: "White Polo T-Shirt Summer",
        price: 30.00),
    ClothingItem(
        name: "Polo Cap",
        image: "https://m.media-amazon.com/images/I/51ZL+pCxirL._AC_SL1200_.jpg",
        description: "Black Polo Cap with White Logo",
        price: 39.00),
    ClothingItem(
        name: "Polo Jacket",
        image: "https://dtcralphlauren.scene7.com/is/image/PoloGSI/s7-AI710950912001_lifestyle?",
        description: "Black Polo jacket with red logo",
        price: 150.00)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("213030"),
        backgroundColor: Colors.lightGreen[100],
        leading: const Icon(Icons.menu),
        elevation: 3,
      ),
      // listView Builder
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final ClothingItem item = clothingItems[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(item: item),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Container(
                height: 450,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      item.image,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item.name,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final ClothingItem item;
  const ProductDetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.lightGreen[100],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            item.image,
            height: 450,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted,
                decorationColor: Colors.lightGreen,
                decorationThickness: 2,
                color: Colors.green[900],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              item.description,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.2,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                decorationStyle: TextDecorationStyle.double,
              ),
            ),
          ),
        ],
      ),
    );
  }
}