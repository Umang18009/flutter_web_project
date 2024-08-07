import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_web_project/controller/login_controller/login_screen_controller.dart';
import 'package:get/get.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginScreenController loginScreenController = Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    debugPrint("===[${MediaQuery.of(context).size.width}}]===");
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      backgroundColor:const Color(0xFF20B37D),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            child: Particles(
              awayRadius: 50,
              particles:createParticles(),
              height: h,
              width: w,
              onTapAnimation: true,
              awayAnimationDuration: const Duration(milliseconds: 100),
              awayAnimationCurve: Curves.easeIn,
              enableHover: true,
              hoverRadius: 20,
              connectDots: false,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipPath(
              clipBehavior: Clip.antiAlias,

            )
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: h*.8,
              width: w*.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(1, 5),
                    blurRadius: 10,
                    spreadRadius: 2
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(child: Image(image: Svg("assets/svg/login_svg.svg"),fit: BoxFit.fill,)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h*0.05,),
                        Center(child: Text("Create Account",style: TextStyle(fontSize: w*.03,fontFamily: "one",fontWeight: FontWeight.bold),)),
                        SizedBox(height: h*0.02,),
                        Center(child: Text("Let's get started with creating your account.",style: TextStyle(fontSize: w*.012,fontFamily: "two",fontWeight: FontWeight.normal),)),
                        SizedBox(height: h*0.05,),
                        Padding(
                          padding: EdgeInsets.only(left: w*0.01),
                          child: Text("Name",style: TextStyle(fontSize: w*0.009),),
                        ),
                        Container(
                          height: w*0.070,
                          margin: EdgeInsets.only(right: w*0.02),
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            style: TextStyle(fontSize: w*0.015),
                            decoration: InputDecoration(
                              hintText: "Enter your name",
                              prefixIcon: Icon(Icons.person,size: w*0.014,),
                              contentPadding: EdgeInsets.only(left: w*0.01,bottom: 2),
                              hintStyle: TextStyle(fontSize: w*0.012),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.2),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w*0.01),
                          child: Text("Email",style: TextStyle(fontSize: w*0.009),),
                        ),
                        Container(
                          height: w*0.070,
                          margin: EdgeInsets.only(right: w*0.02),
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            style: TextStyle(fontSize: w*0.015),
                            decoration: InputDecoration(
                              hintText: "Enter your email",
                              prefixIcon: Icon(Icons.email_outlined,size: w*0.014,),
                              contentPadding: EdgeInsets.only(left: w*0.01,bottom: 2),
                              hintStyle: TextStyle(fontSize: w*0.012),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.2),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFF20B37D),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(2, 3)
                                )
                              ]
                            ),
                            child: Center(child: Text("Create Account",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: "one",fontWeight: FontWeight.bold),)),
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
  List<Particle> createParticles() {
    var rng = Random();
    List<Particle> particles = [];
    for (int i = 0; i < 200; i++) {
      particles.add(Particle(
        color: Colors.greenAccent,
        size: rng.nextDouble() * 4,
        velocity: Offset(rng.nextDouble() * 30 * randomSign(),
            rng.nextDouble() * 30 * randomSign()),
      ));
    }
    return particles;
  }

  double randomSign() {
    var rng = Random();
    return rng.nextBool() ? 1 : -1;
  }
}
