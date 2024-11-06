import 'package:flutter/material.dart';
import 'package:pos/component/app_text_field.dart';
import 'package:pos/component/customtablecell/custom_table_cell.dart';
import 'package:pos/res/color/app_color.dart';
import 'package:pos/view/branch/sales_products_view/sale_invoice_view/sale_invoice_view.dart';

class SelectedProductForSaleView extends StatefulWidget {
  const SelectedProductForSaleView({super.key});

  @override
  State<SelectedProductForSaleView> createState() => _SelectedProductForSaleViewState();
}

class _SelectedProductForSaleViewState extends State<SelectedProductForSaleView> {
  List<TextEditingController> quantityControllers = [];

  // Sample data for the table
  List<Map<String, dynamic>> products = List.generate(5, (index) => {
    'productName': 'Product $index',
    'description': 'Description $index',
    'unitPrice': 200.0, // Assuming a fixed price for simplicity
    'quantity': 2, // Initial quantity
  });

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each product
    for (var product in products) {
      quantityControllers.add(TextEditingController(text: product['quantity'].toString()));
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    for (var controller in quantityControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        /// all selected Products
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
                      // columnSpacing: 85,
                      headingTextStyle: TextStyle(color: AppColor.black,fontWeight: FontWeight.bold,fontSize: 14),
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
                      rows: List.generate(products.length, (index) {
                        final product = products[index];
                        final unitPrice = product['unitPrice'];
                        final discount = 0.0;
                        final tax = 5.0;
                        double quantity = double.parse(quantityControllers[index].text);
                        double total = (quantity * unitPrice) - discount + tax;

                        return DataRow(
                          cells: [
                            DataCell(Text(product['productName'])),
                            DataCell(Text(product['description'])),
                            DataCell(
                              TextField(
                                controller: quantityControllers[index],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(border: InputBorder.none),
                                onChanged: (value) {
                                  setState(() {
                                    products[index]['quantity'] = double.tryParse(value) ?? 0;
                                  });
                                },
                              ),
                            ),
                            DataCell(Text(unitPrice.toStringAsFixed(2))),
                            DataCell(Text(discount.toStringAsFixed(2))),
                            DataCell(Text(tax.toStringAsFixed(2))),
                            DataCell(Text(total.toStringAsFixed(2))),
                            DataCell(InkWell(
                              onTap: (){

                              },
                              child: Icon(Icons.remove_circle,size: 18,),
                            ),
                            ),
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
                        "0.00",
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
    );
  }
}