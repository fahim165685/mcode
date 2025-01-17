
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/cart/controller/card_controller.dart';
//MyCartProduct
class MyCartProduct extends StatelessWidget {
  final String name, image;
  final double price;
  final VoidCallback onRemove;
  final int qut;
  CardController controller;

   MyCartProduct({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.onRemove,
    this.qut = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      width: Get.width,
      height: 120,
      child: Row(
        children: [
          //Image
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Text(
                  name,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text("Total: ${qut.toString()}",style: const TextStyle(
                  fontSize: 18
                )),
                const Spacer(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     //price
                     Expanded(
                       child: Text(
                        "৳$price",
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                ),
                     ),
                     //Quantity
                     Expanded(
                       child: Row(
                         children: [
                           InkWell(
                             onTap: () {},
                             borderRadius: BorderRadius.circular(50),
                             splashColor: Colors.red.withOpacity(0.5),
                             child: CircleAvatar(
                               backgroundColor: Colors.grey.withOpacity(0.2),
                               foregroundColor: kPrimaryColor,
                               radius: 15,
                               child: const Icon(Icons.add),
                             ),
                           ),
                           const SizedBox(width: 5,),
                           Text("X$qut"),
                           const SizedBox(width: 5,),
                           InkWell(
                             onTap: () {},
                             borderRadius: BorderRadius.circular(50),
                             splashColor: Colors.red.withOpacity(0.5),
                             child: CircleAvatar(
                               backgroundColor: Colors.grey.withOpacity(0.2),
                               foregroundColor: kPrimaryColor,
                               radius: 15,
                               child: const Icon(Icons.remove),
                             ),
                           ),
                         ],
                       ),
                     )
                   ],
                 ),
                const Spacer(),
              ],
            ),
          ),
          InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.circular(30),
            overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0.2)),
            child: Ink(
              height:double.infinity,
              padding:const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Icon(
                Icons.delete_outline,
                size:35,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
