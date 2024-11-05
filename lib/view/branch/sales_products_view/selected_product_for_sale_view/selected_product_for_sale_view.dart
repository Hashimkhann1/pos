import 'package:flutter/material.dart';
import 'package:pos/component/customtablecell/custom_table_cell.dart';
import 'package:pos/res/color/app_color.dart';
import 'package:pos/view/branch/sales_products_view/sale_invoice_view/sale_invoice_view.dart';

class SelectedProductForSaleView extends StatelessWidget {
  const SelectedProductForSaleView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [

        /// all selected Products
        Container(
          alignment: Alignment.topCenter,
          width: width,
          height: height * 0.76,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.black.withOpacity(0.5))
          ),
          child: Column(
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(0.7),
                  1: FlexColumnWidth(2.2),
                  2: FlexColumnWidth(1.3),
                  3: FlexColumnWidth(1.6),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(1.6),
                  6: FlexColumnWidth(0.6),
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
                      HeaderCustomTableCell(title: "Product Name"),
                      HeaderCustomTableCell(title: "Price"),
                      HeaderCustomTableCell(title: "Qty"),
                      HeaderCustomTableCell(title: "Discount"),
                      HeaderCustomTableCell(title: "Total"),
                      HeaderCustomTableCell(title: "Delete Icon"),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context,index){
                    return Table(
                      columnWidths: const {
                        0: FlexColumnWidth(0.7),
                        1: FlexColumnWidth(2.2),
                        2: FlexColumnWidth(1.3),
                        3: FlexColumnWidth(1.6),
                        4: FlexColumnWidth(1),
                        5: FlexColumnWidth(1.6),
                        6: FlexColumnWidth(0.6),
                      },
                      border: TableBorder.all(
                        color: Colors.grey.shade300,
                      ),
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(

                          ),
                          children: [
                            HeaderCustomTableCell(title: index.toString(),color: AppColor.black.withOpacity(0.5),),
                            HeaderCustomTableCell(title: "Product Name 1234",color: AppColor.black.withOpacity(0.5)),
                            HeaderCustomTableCell(title: "10000",color: AppColor.black.withOpacity(0.5)),
                            HeaderCustomTableCell(title: "Qty",color: AppColor.black.withOpacity(0.5)),
                            HeaderCustomTableCell(title: "100",color: AppColor.black.withOpacity(0.5)),
                            HeaderCustomTableCell(title: "20403",color: AppColor.black.withOpacity(0.5)),
                            const Icon(Icons.delete,color: Colors.red,)                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        /// Sales Invoice
        const SaleInvoiceView()
      ],
    );
  }
}