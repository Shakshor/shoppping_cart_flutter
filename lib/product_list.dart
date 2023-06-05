import 'package:flutter/material.dart';
// badges
import 'package:badges/badges.dart' as badges;


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  // static data

  List<String> productName = ['Mango' , 'Orange' , 'Grapes' , 'Banana' , 'Chery' , 'Peach','Mixed Fruit Basket',] ;
  List<String> productUnit = ['KG' , 'Dozen' , 'KG' , 'Dozen' , 'KG' , 'KG','KG',] ;
  List<int> productPrice = [10, 20 , 30 , 40 , 50, 60 , 70 ] ;
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg' ,
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg' ,
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg' ,
    'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612' ,
    'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612' ,
    'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612' ,
    'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612' ,
  ] ;





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Product List Page'),

        // sidebar content
        actions: const [

          // badges
          Center(
            child: badges.Badge(
              // position: badges.BadgePosition.topEnd(top: -10),
              badgeAnimation: badges.BadgeAnimation.fade(
                animationDuration: Duration(milliseconds: 300),
              ),

              badgeContent: Text('0', style: TextStyle(color: Colors.white),),
              child:  Icon(Icons.shopping_bag_outlined),
            ),
          ),

          // spacing at the end
          SizedBox(width: 30,),

        ],

      ),

      // main content goes here
      body: Column(

        children: [

          Expanded(
              child: ListView.builder(
                  itemCount: productName.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(

                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,

                              children: [

                                // image
                                Image(
                                    height: 100,
                                    width: 100,
                                    image: NetworkImage(productImage[index].toString()),
                                ),


                                // spacing
                                const SizedBox(width: 10,),

                                // product details
                                Expanded(
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(productName[index].toString(), style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      const SizedBox(height: 5,),
                                      Text(productUnit[index].toString() + ' ' + r'$' + productPrice[index].toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),),

                                      const SizedBox(height: 5,),

                                      // button
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(

                                          height: 35,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                          ),
                                          child: const Center(child: Text('Add To Cart',
                                          style: TextStyle(color: Colors.white),
                                          ),),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  )
          ),

        ],

      ),


    );
  }
}
