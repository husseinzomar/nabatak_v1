import 'package:flutter/material.dart';
import 'package:nabatak_v1/l10n/app_localizations.dart';

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
                            AppLocalizations.of(
                              context,
                            )!.searchHint, // استخدم الترجمة هنا
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
                                AppLocalizations.of(
                                  context,
                                )!.specialOffersTitle,
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
                  AppLocalizations.of(context)!.categoriesTitle,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 100, // ارتفاع العنصر
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _CategoryItem(
                          'assets/plant2.jpeg',
                          AppLocalizations.of(context)!.ornamentalPlants,
                        ),
                        SizedBox(width: 16),
                        _CategoryItem(
                          'assets/plant3.jpeg',
                          AppLocalizations.of(context)!.indoorPlants,
                        ),
                        SizedBox(width: 16),
                        _CategoryItem(
                          'assets/plant4.jpeg',
                          AppLocalizations.of(context)!.outdoorPlants,
                        ),
                        SizedBox(width: 16),
                        _CategoryItem(
                          'assets/plant5.jpeg',
                          AppLocalizations.of(context)!.cacti,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              // منتجات جديدة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  AppLocalizations.of(context)!.newProductsTitle,
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
            fontSize: 14,
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
    final plantNames = [
      AppLocalizations.of(context)!.ornamentalPlants,
      AppLocalizations.of(context)!.indoorPlants,
      AppLocalizations.of(context)!.outdoorPlants,
      AppLocalizations.of(context)!.cacti,
      AppLocalizations.of(context)!.newProductsTitle,
    ];
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
    final plantNames = [
      AppLocalizations.of(context)!.ornamentalPlants,
      AppLocalizations.of(context)!.indoorPlants,
      AppLocalizations.of(context)!.outdoorPlants,
      AppLocalizations.of(context)!.cacti,
      AppLocalizations.of(context)!.newProductsTitle,
    ];
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
