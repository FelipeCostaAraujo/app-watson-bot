import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

Widget flareLoading(BuildContext context){
  final double height = MediaQuery.of(context).size.height * 0.3;
  final double width = MediaQuery.of(context).size.width * 0.3;
  return Center(
      child: Container(
          height: height,
          width: width,
          child: FlareActor("assets/animations/loading_anim_orange.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:"Aura")
      ));
}