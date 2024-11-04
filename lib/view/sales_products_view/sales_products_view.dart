import 'package:flutter/material.dart';
import 'package:pos/component/app_text_field.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';


class SalesProductsView extends StatelessWidget {
  const SalesProductsView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
        width: width < 1300 ? width * 0.45 : width * 0.42,
        decoration: BoxDecoration(color: AppColor.white,border: Border.all(color: AppColor.black.withOpacity(0.4))),
        margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: height * 0.01),
          child: Column(
            children: [
               const Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: AppTextField(
                        hintText: "Search products",
                        // borderRadius: 0,
                      )),

                ],
              ),
              SizedBox(height: height * 0.02,),

              /// All products
              Expanded (
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
                                fontSize: 18,
                                color: AppColor.black.withOpacity(0.8),
                              )),DataColumn(
                              label: MyText(
                                title: 'Product Name',
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: AppColor.black.withOpacity(0.8),
                              )),
                          DataColumn(
                              label: MyText(
                                  title: 'In Stock',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: AppColor.black.withOpacity(0.8))),
                          DataColumn(
                              label: MyText(
                                  title: 'Unit Price',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: AppColor.black.withOpacity(0.8))),
                        ],
                        rows: List.generate(40, (index) {
                          return DataRow(

                              onSelectChanged: (val){

                                print(index);

                                // final Map<String , dynamic> proData = {
                                //   "id": state.allProductsData[index].id.toString(),
                                //   "productName" : state.allProductsData[index].productName.toString(),
                                //   "salesPrice" : state.allProductsData[index].salesPrice.toString(),
                                //   "purchasePrice" : state.allProductsData[index].purchasePrice.toString(),
                                //   "category" : state.allProductsData[index].category.toString(),
                                //   "productQuantity" : state.allProductsData[index].productQuantity.toString(),
                                //   "addedDate" : state.allProductsData[index].addedDate.toString()
                                // };

                                // context.read<SelectedProductForSellBloc>().add(AddSelectedProductToSellSection(productDetail: proData));
                              }, cells: [
                            DataCell(
                              MyText(title: index.toString()),
                            ),const DataCell(
                              MyText(title: "Product Name"),
                            ),
                            DataCell(
                              // MyText(title: state.allProductsData[index].productQuantity.toString()),
                              MyText(title: "${2 * index}"),
                            ),
                            DataCell(
                              // MyText(title: state.allProductsData[index].salesPrice.toString()),
                              MyText(title: "${index == 0 ? 40 : 6 * index}"),
                            ),
                          ]);
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
                            color: AppColor.black.withOpacity(0.3)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
