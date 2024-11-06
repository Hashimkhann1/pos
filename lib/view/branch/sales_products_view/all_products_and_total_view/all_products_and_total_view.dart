import 'package:flutter/material.dart';
import 'package:pos/component/drawer/drawer_widget.dart';
import '../../../../component/app_text_field.dart';
import '../../../../component/my_text.dart';
import '../../../../res/color/app_color.dart';
import '../sales_products_view.dart';
import '../selected_product_for_sale_view/selected_product_for_sale_view.dart';

class AllProductsView extends StatefulWidget {
  AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  List<Product> addProduct = [];
  TextEditingController _searchController = TextEditingController();

  // Filtered list of products
  List<Product> filteredProductList = List.from(mockProductList);

  @override
  void initState() {
    super.initState();
    // Add listener to update the filtered list based on search input
    _searchController.addListener(_filterProducts);
  }

  // Method to filter the product list based on search input
  void _filterProducts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredProductList = mockProductList.where((product) {
        return product.productName.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  // Inside _AllProductsViewState class

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sale Product"),
      ),
      drawer: const DrawerWidget(),
      body: Row(
        children: [
          Container(
            width: width < 1300 ? width * 0.45 : width * 0.35,
            decoration: BoxDecoration(color: AppColor.white, border: Border.all(color: AppColor.grey.withOpacity(0.4))),
            margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: height * 0.01),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: AppTextField(
                          hintText: "Search products",
                          controller: _searchController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),

                  /// All products
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: width < 1160 ? Axis.horizontal : Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          width: width < 1160 ? width * 0.54 : width,
                          child: DataTable(
                            columns: [
                              DataColumn(
                                label: MyText(
                                  title: '#',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColor.black.withOpacity(0.8),
                                ),
                              ),
                              DataColumn(
                                label: MyText(
                                  title: 'Product Name',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColor.black.withOpacity(0.8),
                                ),
                              ),
                              DataColumn(
                                label: MyText(
                                  title: 'In Stock',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColor.black.withOpacity(0.8),
                                ),
                              ),
                              DataColumn(
                                label: MyText(
                                  title: 'Unit Price',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColor.black.withOpacity(0.8),
                                ),
                              ),
                            ],
                            rows: List.generate(filteredProductList.length, (index) {
                              return DataRow(
                                onSelectChanged: (val) {
                                  setState(() {
                                    // Ensure you are selecting from filteredProductList
                                    var selectedProduct = filteredProductList[index];

                                    // Check if the product is already in the addProduct list
                                    bool productExists = false;

                                    if (selectedProduct.quantity > 0) {
                                      // Check if the product already exists in the addProduct list
                                      for (var existingProduct in addProduct) {
                                        if (existingProduct.productName == selectedProduct.productName) {
                                          existingProduct.quantity += 1;
                                          productExists = true;
                                          break;
                                        }
                                      }

                                      // If product doesn't exist, add it to the list
                                      if (!productExists) {
                                        addProduct.add(Product(
                                          productName: selectedProduct.productName,
                                          description: selectedProduct.description,
                                          quantity: 1,
                                          price: selectedProduct.price,
                                          discount: selectedProduct.discount,
                                          tax: selectedProduct.tax,
                                        ));
                                      }

                                      // Decrease the stock quantity of the selected product
                                      selectedProduct.quantity -= 1;

                                      print("Selected Product Added: ${selectedProduct.productName}");
                                      print("Updated AddProduct List: $addProduct");
                                      print("Updated MockProduct List: $mockProductList");
                                    }
                                  });
                                },
                                cells: [
                                  DataCell(MyText(title: "${index + 1}")),
                                  DataCell(MyText(title: "${filteredProductList[index].productName}")),
                                  DataCell(MyText(title: "${filteredProductList[index].quantity}")),
                                  DataCell(MyText(title: "${filteredProductList[index].price}")),
                                ],
                              );
                            }),
                            columnSpacing: 10.0,
                            horizontalMargin: 10.0,
                            dividerThickness: 1.0,
                            showBottomBorder: true,
                            sortColumnIndex: 0,
                            sortAscending: true,
                            dataRowHeight: 32.0,
                            headingRowHeight: 36.0,
                            showCheckboxColumn: false,
                            border: TableBorder.all(
                              color: AppColor.grey.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /// Selected product for sale view
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: AppColor.primaryColor,
                    child: Center(child: Text("Cash Sale",style: TextStyle(color: AppColor.white,fontWeight: FontWeight.bold,fontSize: 14),)),
                  ),
                  SizedBox(height: 10,),
                  AppTextField(hintText: "Search Item"),
                  SizedBox(height: 10,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: DataTable(
                        headingTextStyle: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 14),
                        headingRowHeight: 30,
                        border: TableBorder.all(color: AppColor.grey.withOpacity(0.1)),
                        columns: [
                          DataColumn(label: Text('Product')),
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Qty')),
                          DataColumn(label: Text('Price')),
                          DataColumn(label: Text('Discount')),
                          DataColumn(label: Text('Tax')),
                          DataColumn(label: Text('Total')),
                          DataColumn(label: Text('Delete')),
                        ],
                        rows: List.generate(addProduct.length, (index) {
                          var product = addProduct[index];
                          return DataRow(
                            cells: [
                              DataCell(Text(product.productName)),
                              DataCell(Text(product.description)),
                              DataCell(Text(addProduct[index].quantity.toString())),
                              DataCell(Text(product.price.toString())),
                              DataCell(Text(product.discount.toString())),
                              DataCell(Text(product.tax.toString())),
                              DataCell(Text((product.price * product.quantity).toStringAsFixed(2))),
                              DataCell(IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    addProduct.removeAt(index);
                                  });
                                },
                              )),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Total: ", style: TextStyle(fontSize: 16)),
                        Text(
                          addProduct.fold(0, (previousValue, product) {
                            return previousValue + (product.price * product.quantity).toInt();
                          }).toStringAsFixed(2),
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Hold Sale logic
                          },
                          child: Text('Hold Sale'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Payment logic
                          },
                          child: Text('Payment'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class Product {
  String productName;
  String description;
  int quantity;
  double price;
  double discount;
  double tax;

  Product({
    required this.productName,
    required this.description,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.tax,
  });

  @override
  String toString() {
    return 'Product(productName: $productName, description: $description, quantity: $quantity, price: $price, discount: $discount, tax: $tax)';
  }

}


List<Product> mockProductList = [
  Product(
    productName: 'Apple',
    description: 'Fresh and juicy apple',
    quantity: 10,
    price: 120.0,
    discount: 1.0,
    tax: 0.5,
  ),
  Product(
    productName: 'Carrot',
    description: 'Organic and crunchy carrot',
    quantity: 15,
    price: 150.0,
    discount: 0.5,
    tax: 0.2,
  ),
  Product(
    productName: 'Banana',
    description: 'Ripe and sweet banana',
    quantity: 12,
    price: 200.0,
    discount: 0.7,
    tax: 0.3,
  ),
  Product(
    productName: 'Potato',
    description: 'Freshly harvested potato',
    quantity: 20,
    price: 120.2,
    discount: 0.3,
    tax: 0.1,
  ),
  Product(
    productName: 'Orange',
    description: 'Citrusy and tangy orange',
    quantity: 18,
    price: 140.5,
    discount: 0.8,
    tax: 0.4,
  ),
  Product(
    productName: 'Tomato',
    description: 'Juicy and ripe tomato',
    quantity: 25,
    price: 110.8,
    discount: 0.6,
    tax: 0.3,
  ),
  Product(
    productName: 'Grapes',
    description: 'Sweet and succulent grapes',
    quantity: 14,
    price: 250.5,
    discount: 1.0,
    tax: 0.5,
  ),
  Product(
    productName: 'Cucumber',
    description: 'Fresh and crunchy cucumber',
    quantity: 22,
    price: 400.0,
    discount: 0.4,
    tax: 0.2,
  ),
  Product(
    productName: 'Pineapple',
    description: 'Tropical and sweet pineapple',
    quantity: 8,
    price: 500.0,
    discount: 1.2,
    tax: 0.6,
  ),
  Product(
    productName: 'Spinach',
    description: 'Fresh and leafy spinach',
    quantity: 30,
    price: 100.0,
    discount: 0.2,
    tax: 0.1,
  ),
  Product(
    productName: 'Peach',
    description: 'Juicy and fragrant peach',
    quantity: 10,
    price: 300.0,
    discount: 0.9,
    tax: 0.4,
  ),
  Product(
    productName: 'Onion',
    description: 'Sharp and pungent onion',
    quantity: 17,
    price: 100.1,
    discount: 0.3,
    tax: 0.2,
  ),
  Product(
    productName: 'Mango',
    description: 'Sweet and tropical mango',
    quantity: 9,
    price: 300.5,
    discount: 1.0,
    tax: 0.5,
  ),
  Product(
    productName: 'Lettuce',
    description: 'Crisp and refreshing lettuce',
    quantity: 28,
    price: 100.3,
    discount: 0.5,
    tax: 0.2,
  ),
  Product(
    productName: 'Strawberry',
    description: 'Fresh and juicy strawberry',
    quantity: 6,
    price: 400.0,
    discount: 1.5,
    tax: 0.7,
  ),
];