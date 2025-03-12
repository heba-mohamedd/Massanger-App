import 'package:flutter/material.dart';
import 'package:messenger_app/products_Item.dart';
import 'dio/api_provider.dart';
import 'models/product_model.dart';

class Productpage extends StatefulWidget {
  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  ProductsModel? productsModel;
  bool isLoading = true;
  getProductsFromApiProvider() async {
    productsModel = await ApiProvider().getProducts();
    print("${productsModel?.products[0]}");
    setState(() {
      isLoading = false;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductsFromApiProvider();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: isLoading?
      Center(child: CircularProgressIndicator())
          :ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder:
            (context, index) =>
                ProductsItem(product: productsModel!.products[index]),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: productsModel!.products.length,
      ),
    );
  }
}
