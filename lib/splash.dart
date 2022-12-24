import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/user/splash/splash_screen.dart';



class SplashController extends GetxController {
  RxBool animate= false.obs;
  @override
  void onInit() {
    startAnimation();
    super.onInit();
  }

  //animate
  Future startAnimation()async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
   Get.offAll(()=>const SplashScreen(),duration: const Duration(milliseconds: 500),transition: Transition.fade);
  }

}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


   SplashController controller=Get.put(SplashController());
    return Scaffold(

      body:SizedBox(
        child: Stack(
          children: [
            AnimatedPositioned(
                  duration: const Duration(milliseconds: 1500),
                top: controller.animate.value ? 0: -30,
                left:controller.animate.value ? 0: -50,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFf4b8f5),
                        Color(0xFFf76b1c),
                      ]
                    ),
                    shape: BoxShape.circle,
                    color: Colors.deepPurpleAccent
                  ),
                ),
            ),

            AnimatedPositioned(
                duration: const Duration(milliseconds: 1500),
                right: controller.animate.value ? -120:-25,
                bottom:  controller.animate.value ? -120:-50,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFf9e2ae),
                        Color(0xFFa6d676),
                      ]
                    ),
                    shape: BoxShape.circle,
                    color: Colors.deepPurpleAccent
                  ),
                ),
            ),

            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(image: NetworkImage("https://live.staticflickr.com/8465/8376267144_b0c41f8d65_b.jpg"),fit: BoxFit.cover,opacity: 0.05),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ])),
            ),
             AnimatedPositioned(
               duration: const Duration(milliseconds: 1500),
                top:controller.animate.value ? 0:100,
                bottom: 0,
                left: 0,
                right: controller.animate.value ? 0:-600,
                child: Center(
                  child: Image.asset("assets/images/MCB_Logo_ Main.png",width: Get.width*0.9,),
                ),
              ),

          ],
        ),
      ),
    );
  }
}