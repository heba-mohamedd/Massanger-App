import 'package:flutter/material.dart';
import 'models/product_model.dart';

class ProductsItem extends StatelessWidget {
  ProductsItem({super.key , required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26 ,width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              backgroundImage: NetworkImage(
                "${product.thumbnail}",
              ),
            ),
            SizedBox(height: 10),
            Text("title :${product.title} ", style: TextStyle(fontSize: 20, color: Colors.grey,),),
            Text("category : ${product.category} ", style: TextStyle(fontSize: 20, color: Colors.grey,),),
            Text("price : ${product.price} ", style: TextStyle(fontSize: 20, color: Colors.grey,),),
          ],
        ),
      ),
    );
  }
}
