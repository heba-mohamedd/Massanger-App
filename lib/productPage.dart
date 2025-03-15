import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/products_Item.dart';
import 'dio/api_provider.dart';
import 'messanger/cubit/product_cubit.dart';
import 'models/product_model.dart';

class Productpage extends StatefulWidget {
  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  ProductsModel? productsModel;
  // bool isLoading = true;
  // getProductsFromApiProvider() async {
  //   productsModel = await ApiProvider().getProducts();
  //   print("${productsModel?.products[0]}");
  //   setState(() {
  //     isLoading = false;
  //   });
  //
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getProductsFromApiProvider();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ProductError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is ProductSuccess) {
            productsModel = state.productsModel;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              leading: Icon(
                Icons.production_quantity_limits,
                color: Colors.white,
                size: 30,
              ),
              centerTitle: true,
              title: Text(
                "Products",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body:
                state is ProductLoading
                    ? Center(child: CircularProgressIndicator())
                    : state is ProductError
                    ? Center(child: Text(state.errorMessage))
                    : ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (context, index) => ProductsItem(
                            product:
                                context
                                    .read<ProductCubit>()
                                    .productsModel!
                                    .products[index],
                          ),
                      separatorBuilder:
                          (context, index) => SizedBox(height: 10),
                      itemCount:
                          context
                              .read<ProductCubit>()
                              .productsModel!
                              .products
                              .length,
                    ),
          );
        },
      ),
    );
  }
}
