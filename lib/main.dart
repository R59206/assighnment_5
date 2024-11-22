import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food RecyclerView',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: FoodListScreen(),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'Pizza',
      'description': 'Cheesy and delicious pizza.',
      'image': 'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?w=720',
    },
    {
      'name': 'Burger',
      'description': 'Juicy grilled beef burger.',
      'image': 'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?w=720',
    },
    {
      'name': 'Pasta',
      'description': 'Italian-style creamy pasta.',
      'image': 'https://images.pexels.com/photos/8500/food-dinner-pasta-spaghetti-8500.jpeg?w=720',
    },
    {
      'name': 'Salad',
      'description': 'Healthy green veggie salad.',
      'image': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?w=720',
    },
    {
      'name': 'Ice Cream',
      'description': 'Sweet and cold dessert.',
      'image': 'https://images.pexels.com/photos/331990/pexels-photo-331990.jpeg?w=720',
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food RecyclerView'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    item['image']!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[800],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item['description']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${item['name']} added to cart!'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Add to Cart'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
