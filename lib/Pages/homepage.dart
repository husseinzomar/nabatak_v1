import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: Implement logic for fetching and filtering plants
  List<String> plantCategories = [
    'الكل',
    'نباتات داخلية',
    'نباتات خارجية',
    'زهور',
    'مزهريات',
    'الأكثر مبيعًا',
  ];
  String selectedCategory = 'الكل';

  // TODO: Implement logic for managing the cart
  int cartItemCount = 0; // Placeholder for the number of items in the cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Or Colors.green[50] for a light green
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Replace with your app logo
            Icon(Icons.eco, color: Colors.green),
            SizedBox(width: 8),
            Text(
              'نباتك',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.search, color: Colors.green),
          onPressed: () async {
            final String? result = await showSearch(
              context: context,
              delegate: PlantSearchDelegate(),
            );
          },
        ),
        // centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.green),
                onPressed: () {
                  // TODO: Navigate to cart page
                },
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '$cartItemCount',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'مرحبًا، اختار نوع النبات اللي يناسبك 🌱',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plantCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(plantCategories[index]),
                    selected: selectedCategory == plantCategories[index],
                    selectedColor: Colors.green,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = plantCategories[index];
                        // TODO: Filter plants based on selected category
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75, // Adjust as needed
                ),
                itemCount: 10, // TODO: Replace with actual plant count
                itemBuilder: (context, index) {
                  // TODO: Replace with actual PlantItem widget
                  return PlantItemPlaceholder();
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: cartItemCount > 0
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Navigate to cart page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                label: Text(
                  'اذهب إلى السلة',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          : null, // Hide button if cart is empty
    );
  }
}

// Placeholder widget for a plant item in the grid
class PlantItemPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200], // Placeholder for image
              child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'اسم النبتة', // Placeholder for plant name
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'السعر', // Placeholder for price
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.green),
                  onPressed: () {
                    // TODO: Add plant to cart
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlantSearchDelegate extends SearchDelegate<String> {
  final List<String> plantNames = [
    'صبار',
    'نخلة',
    'زهرة الشمس',
    'لافندر',
    'نعناع',
    'ريحان',
    // أضف المزيد من أسماء النباتات هنا
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = plantNames.where((name) => name.contains(query)).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = plantNames
        .where((name) => name.contains(query))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
