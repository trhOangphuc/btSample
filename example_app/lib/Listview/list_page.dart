import 'package:example_app/Listview/productBox.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();

  List<Productbox> products = [
    Productbox(name: 'Bear image', description: 'Comment here', price: 100000, image: 'image1.png'),
    Productbox(name: 'Computer image', description: 'Comment here', price: 300000, image: 'image2.png'),
    Productbox(name: 'Print image', description: 'Comment here', price: 200000, image: 'image3.png'),
    Productbox(name: 'Camera image', description: 'Comment here', price: 150000, image: 'image4.png'),
    Productbox(name: 'Photo image', description: 'Comment here', price: 150000, image: 'image5.png'),
    Productbox(name: 'Medicine image', description: 'Comment here', price: 150000, image: 'image6.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing",
          style: TextStyle( fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
        children: products
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Thực hiện hành động khi nút bấm được nhấn
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Product'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(labelText: 'Description'),
                      ),
                      TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Price'),
                      ),
                      TextField(
                        controller: imageController,
                        decoration: InputDecoration(labelText: 'Image'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      final name = nameController.text;
                      final description = descriptionController.text;
                      final price = int.tryParse(priceController.text) ?? 0;
                      final image = imageController.text;

                      if (name.isNotEmpty && description.isNotEmpty && price > 0 && image.isNotEmpty) {
                        setState(() {
                          products.add(Productbox(
                            name: name,
                            description: description,
                            price: price,
                            image: image,
                          ));
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),

    );
  }
}
