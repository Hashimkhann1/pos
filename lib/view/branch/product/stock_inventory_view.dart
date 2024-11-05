


import 'package:flutter/material.dart';

import '../../../component/app_text_field.dart';
import '../../../component/customtablecell/custom_table_cell.dart';
import '../../../component/drawer/drawer_widget.dart';
import '../../../res/color/app_color.dart';

class StockInventoryView extends StatefulWidget {
  const StockInventoryView({super.key});

  @override
  State<StockInventoryView> createState() => _StockInventoryViewState();
}

class _StockInventoryViewState extends State<StockInventoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Inventory"),
      ),
      drawer:  const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: AppTextField(
                    hintText: "Search Product",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(2),
                5: FlexColumnWidth(2),
                6: FlexColumnWidth(2),
                7: FlexColumnWidth(2),
              },
              border: TableBorder.all(
                color: Colors.grey.shade300,
              ),
              children: const [
                TableRow(
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                  ),
                  children: [
                    HeaderCustomTableCell(title: "#"),
                    HeaderCustomTableCell(title: "Barcode"),
                    HeaderCustomTableCell(title: "Product"),
                    HeaderCustomTableCell(title: "Category"),
                    HeaderCustomTableCell(title: "Company"),
                    HeaderCustomTableCell(title: "Purchase Price"),
                    HeaderCustomTableCell(title: "Sale Price"),
                    HeaderCustomTableCell(title: "Quantity"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                      4: FlexColumnWidth(2),
                      5: FlexColumnWidth(2),
                      6: FlexColumnWidth(2),
                      7: FlexColumnWidth(2),
                    },
                    border: TableBorder.all(
                      color: Colors.grey.shade300,
                    ),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: index.isOdd ? Colors.grey.shade100 : AppColor.white,
                        ),
                        children: const [
                          CustomTableCell(title: "#"),
                          CustomTableCell(title: "Barcode"),
                          CustomTableCell(title: "Product"),
                          CustomTableCell(title: "Category"),
                          CustomTableCell(title: "Company"),
                          CustomTableCell(title: "Purchase Price"),
                          CustomTableCell(title: "Sale Price"),
                          CustomTableCell(title: "Stock"),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.primaryColor,
                  ),
                  child: const Center(child: Text("Stock Inventory")),
                ),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Barcode",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Product Name",
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Purchase Price",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Sale Price",
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Whole Sale",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Discount",
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Tax",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Stock",
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Product Type",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Company",
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppTextField(
                          hintText: "Purchase Date",
                        ),
                        SizedBox(width: 10,),
                        AppTextField(
                          hintText: "Expiry Date",
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: (){

                        },
                        child: const Text("Cancel"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: (){

                        },
                        child: const Text("Save"),
                      )
                    ],
                  )
                ],
              );
            },
          );
        },

        label: const Text("Add Product"),
      ),
    );
  }
}
