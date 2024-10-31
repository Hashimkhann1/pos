


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
        title: const Text("Product Inventory"),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: const AppTextField(
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
                        children: [
                          CustomTableCell(title: "#"),
                          CustomTableCell(title: "Barcode"),
                          CustomTableCell(title: "Product"),
                          CustomTableCell(title: "Category"),
                          CustomTableCell(title: "Company"),
                          CustomTableCell(title: "Purchase Price"),
                          CustomTableCell(title: "Sale Price"),
                          CustomTableCell(title: "Quantity"),
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
    );
  }
}
