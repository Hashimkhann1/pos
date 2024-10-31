

import 'package:flutter/material.dart';

import '../../../component/app_text_field.dart';
import '../../../component/customtablecell/custom_table_cell.dart';
import '../../../component/drawer/drawer_widget.dart';
import '../../../res/color/app_color.dart';

class CustomerLedgerView extends StatelessWidget {
  const CustomerLedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Ledger"),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: AppTextField(
                    hintText: "Search Customer",
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
                    HeaderCustomTableCell(title: "Customer Name"),
                    HeaderCustomTableCell(title: "Total Balance"),
                    HeaderCustomTableCell(title: "Received Balance"),
                    HeaderCustomTableCell(title: "Last Balance"),
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
                          CustomTableCell(title: "Shahab Mustafa"),
                          CustomTableCell(title: "12000"),
                          CustomTableCell(title: "1000"),
                          CustomTableCell(title: "11000"),
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
