import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:my_app/components/appbar.dart';
import 'package:my_app/http/httpproducts.dart';
import 'package:my_app/model/clothes.dart';
import 'package:my_app/model/products.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/home/home_screen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
  static String routeName = '/addproduct';
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formkey = GlobalKey<FormState>();
  File? _image;

  String name = '';
  int price = 0;
  String description = '';
  String category = '';
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _image = null;
  }

  //method to open image from gallery
  _imageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  //method to open image from camera
  _imageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Add product"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'Add Product Details',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        letterSpacing: 2.0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image == null
                          ? const AssetImage('assets/images/login-bg.jpg')
                              as ImageProvider
                          : FileImage(_image!),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) => bottomSheet());
                        },
                        child: const Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  maxLength: 30,
                  decoration: const InputDecoration(
                    labelText: 'Product Name:',
                    hintText: 'Enter product name',
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    // price=4;

                    price = int.parse(newValue!);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Price:',
                    hintText: 'Enter product price',
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    description = newValue!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Description:',
                    hintText: 'Enter product description',
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    category = newValue!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Category:',
                    hintText: 'Enter product category:',
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    imageUrl = newValue!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Image Url',
                    hintText: 'Enter image url',
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shadowColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    _formkey.currentState!.save();
                    Product product = Product(
                        name: name,
                        price: price,
                        category: category,
                        description: description,
                        imageUrl: imageUrl);

                    HttpConnectProduct().addProducts(product, _image);
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shadowColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomeScreen()));
                  },
                  child: const Text('Go Back to Home'),
                ),
              ],
            )),
      ),
    );
  }

//widget to build a bottomsheet for image
  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Choose profile photo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _imageFromCamera();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _imageFromGallery();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
