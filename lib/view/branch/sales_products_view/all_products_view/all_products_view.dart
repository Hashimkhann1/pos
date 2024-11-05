import 'package:flutter/material.dart';
import 'package:pos/component/drawer/drawer_widget.dart';
import '../sales_products_view.dart';
import '../selected_product_for_sale_view/selected_product_for_sale_view.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sale Product"),
      ),
      drawer: DrawerWidget(),
      body: Row(
        children: [

          /// All product view
          SalesProductsView(),

          /// Selected product for sale view
          Expanded(child: SelectedProductForSaleView())
        ],
      ),
    );
  }
}
