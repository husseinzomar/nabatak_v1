import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 246, 244),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // مربع البحث
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: PlantSearchDelegate(),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.green),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'ابحث عن نبتة',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // عروض مميزة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'عروض مميزة',
                                style: TextStyle(
                                  color: Colors.green[800],
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/plant1.jpeg', height: 90),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              // التصنيفات
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'التصنيفات',
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _CategoryItem('assets/plant2.jpeg', 'نباتات زينة'),
                    _CategoryItem('assets/plant3.jpeg', 'نباتات داخلية'),
                    _CategoryItem('assets/plant4.jpeg', 'نباتات خارجية'),
                    _CategoryItem('assets/plant5.jpeg', 'صباريات'),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // منتجات جديدة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'منتجات جديدة',
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(child: _ProductItem('assets/plant6.jpeg')),
                    SizedBox(width: 12),
                    Expanded(child: _ProductItem('assets/plant7.jpg')),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// عنصر التصنيف
class _CategoryItem extends StatelessWidget {
  final String image;
  final String label;
  const _CategoryItem(this.image, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.green[50],
          radius: 32,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// عنصر منتج جديد
class _ProductItem extends StatelessWidget {
  final String image;
  const _ProductItem(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(child: Image.asset(image, height: 100)),
    );
  }
}

class PlantSearchDelegate extends SearchDelegate<String> {
  final List<String> plantNames = [
    'نباتات زينة',
    'نباتات داخلية',
    'نباتات خارجية',
    'صباريات',
    'منتجات جديدة',
    // أضف المزيد حسب الحاجة
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = plantNames.where((name) => name.contains(query)).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(results[index]),
        onTap: () => close(context, results[index]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = plantNames
        .where((name) => name.contains(query))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index]),
        onTap: () {
          query = suggestions[index];
          showResults(context);
        },
      ),
    );
  }
}
