import 'package:flutter/material.dart';
import 'package:fisrt_app/components/my_drawer.dart';
import 'package:fisrt_app/components/my_sliver_app_bar.dart';
import 'package:fisrt_app/components/my_current_location.dart';
import 'package:fisrt_app/components/my_description_box.dart';
import 'package:fisrt_app/components/my_tab_bar.dart';
import 'package:fisrt_app/models/store.dart';
import 'package:fisrt_app/models/products.dart';
import 'package:provider/provider.dart';
import 'package:fisrt_app/components/my_product_tile.dart';
import 'package:fisrt_app/pages/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  // tab controller
  late TabController _tabController;

  @override

  void initState(){
    super.initState();
    _tabController = TabController(length: ProductCategory.values.length, vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food items that belong to a specific category
  List<Products> _filterMenuByCategory(ProductCategory category, List<Products> fullMenu){
    return fullMenu.where((product) => product.category == category).toList();
  }

  //Return list of foods in given category
  List<Widget> getProductInThisCategory (List<Products> fullMenu){
    return ProductCategory.values.map((category){

      // get category menu
      List<Products> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){
          // get individual product
          final products = categoryMenu[index];

          // return food tile UI
          return ProductsTile(
              products: products,
              onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(products: products),
                ),
              ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled)=>[
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),


                //My current location
                MyCurrentLocation(),

                //Description box
                MyDescriptionBox(),


              ],
            ),
          ),
        ],
        body: Consumer<Store>(
            builder: (context,store,child) => TabBarView(
              controller: _tabController,
              children: getProductInThisCategory(store.menu),
            ),
        ),
      ),
    );
  }
}