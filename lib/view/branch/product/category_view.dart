import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/component/app_text_button.dart';
import 'package:pos/component/app_text_field.dart';
import 'package:pos/component/drawer/drawer_widget.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';
import 'package:pos/view_model/add_category_view_model/add_category_view_model.dart';
import 'package:pos/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';
import 'package:pos/view_model/bloc/loading_bloc/loading_bloc_state/loading_bloc_state.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_bloc/store_data_bloc.dart';
import 'package:pos/view_model/bloc/store_data_bloc/store_data_state/store_data_state.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const MyText(title: "Product Categories"),
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: Container(
              width: 600,
              height: height * 0.5,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.primaryColor.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ]),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),

                /// Add category title
                const MyText(
                  title: "Add Category",
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: AppColor.primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),

                /// text field
                Form(
                  key: _formKey,
                  child: AppTextField(
                    hintText: "Product Category Name",
                    width: 580,
                    height: 62,
                    controller: categoryController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Category Name";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                /// add category button
                BlocBuilder<LoadingBloc , LoadingBlocState>(builder: (context , state) {
                  return AppTextButton(
                    title: "Add Category",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textColor: AppColor.white,
                    backgroundColor: AppColor.primaryColor,
                    width: 170,
                    height: 38,
                    borderRadius: 12,
                    isLoading: state.isLoading,
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        AddCategoryViewModel().addCategory(context, categoryController.text.toString());
                        categoryController.clear();
                      }
                    },
                  );
                }),
                const SizedBox(
                  height: 10,
                ),

                /// all Categories
                BlocBuilder<StoreDataBloc , StoreDataState>(builder: (context , state) {
                  return state.categoriesList.isEmpty ? MyText(title: "Category is not added yet!",fontSize: 20,color: AppColor.primaryColor,fontWeight: FontWeight.bold,) :  Wrap(
                      children: List.generate(state.categoriesList.length, (index) {
                        return Container(
                          // width: MediaQuery.of(context).size.width * 0.09,
                          width: 190,
                          height: 36,
                          margin:
                          const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //  created class number
                              MyText(
                                title: state.categoriesList[index].toString(),
                                overflow: TextOverflow.ellipsis,
                                color: AppColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              // created class and cancel icon divider
                              const VerticalDivider(
                                color: AppColor.white,
                                thickness: 2,
                                endIndent: 6,
                                indent: 6,
                              ),
                              // created category cancel icon
                              InkWell(
                                onTap: () {
                                  AddCategoryViewModel().removeCategory(context, state.categoriesList[index].toString());
                                },
                                child: const Icon(
                                  Icons.cancel_outlined,
                                  color: AppColor.white,
                                ),
                              )
                            ],
                          ),
                        );
                      }));
                }),
              ])),
        ));
  }
}
