import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/componnent/textfield.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/updateProduct.dart';

import '../componnent/defaultBatton.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({
    super.key,
  });
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, image, discription;

  dynamic price;
  bool inAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              MyTextField(
                onChanged: (data) {
                  productName = data;
                },
                labelText: 'title',
                hintText: 'Product Name',
                keyboradType: TextInputType.text,
              ),
              MyTextField(
                onChanged: (data) {
                  discription = data;
                },
                labelText: 'discription',
                hintText: 'discription Product',
                keyboradType: TextInputType.text,
              ),
              MyTextField(
                onChanged: (data) {
                  price = data;
                },
                labelText: 'price',
                hintText: 'price number',
                keyboradType: TextInputType.number,
              ),
              MyTextField(
                onChanged: (data) {
                  image = data;
                },
                labelText: 'image',
                hintText: 'image Link',
                keyboradType: TextInputType.text,
              ),
              DefaultButton(
                onTap: () async {
                  inAsyncCall = true;
                  setState(() {});

                  try {
                    await UpdataProduct(product);
                  } catch (e) {
                    print('error in updata product ${e.toString()}');
                  }
                  inAsyncCall = false;
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UpdataProduct(ProductModel product) async {
    await UpdateProdutServices().updatProduts(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        description: discription == null ? product.description : discription!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
