import 'package:flutter/material.dart';
import 'package:template/gen/colors.gen.dart';

extension AppTextExtensions on TextStyle {
  //Colors
  TextStyle get white => copyWith(color: ColorName.white);
  TextStyle get black => copyWith(color: ColorName.black);
  TextStyle get blue => copyWith(color: ColorName.blue);
  TextStyle get grey => copyWith(color: ColorName.grey);
  TextStyle get lightGrey => copyWith(color: ColorName.lightGrey);
  TextStyle get green => copyWith(color: ColorName.green);
  TextStyle get red => copyWith(color: ColorName.red);

  //Weights
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  //Sizes
  TextStyle get s10 => copyWith(fontSize: 10);
  TextStyle get s12 => copyWith(fontSize: 12);
  TextStyle get s14 => copyWith(fontSize: 14);
  TextStyle get s15 => copyWith(fontSize: 15);
  TextStyle get s16 => copyWith(fontSize: 16);
  TextStyle get s18 => copyWith(fontSize: 18);
  TextStyle get s20 => copyWith(fontSize: 20);
  TextStyle get s22 => copyWith(fontSize: 22);
  TextStyle get s24 => copyWith(fontSize: 24);
  TextStyle get s26 => copyWith(fontSize: 26);
  TextStyle get s28 => copyWith(fontSize: 28);
  TextStyle get s30 => copyWith(fontSize: 30);
  TextStyle get s32 => copyWith(fontSize: 32);
  TextStyle get s34 => copyWith(fontSize: 34);
  TextStyle get s36 => copyWith(fontSize: 36);
  TextStyle get s38 => copyWith(fontSize: 38);
  TextStyle get s40 => copyWith(fontSize: 38);
  TextStyle get s42 => copyWith(fontSize: 40);
  TextStyle get s44 => copyWith(fontSize: 44);
  TextStyle get s46 => copyWith(fontSize: 46);
  TextStyle get s48 => copyWith(fontSize: 48);
  TextStyle get s50 => copyWith(fontSize: 50);
  TextStyle get s52 => copyWith(fontSize: 52);
  TextStyle get s54 => copyWith(fontSize: 54);

  //Decorations
  TextStyle get underlined => copyWith(decoration: TextDecoration.underline);
  TextStyle get italic => copyWith(decoration: TextDecoration.underline);
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
}
