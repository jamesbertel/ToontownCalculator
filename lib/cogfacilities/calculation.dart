import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../homepage.dart';
import 'bossbotFacility.dart';

abstract class ICogFacility {
  String calculateStats(int totalObtained, int totalNeeded);
  String printStats(List<int> nums);
} // INTERFACE

class cogFacility extends ICogFacility {
  String calculateStats(int totalObtained, int totalNeeded) { return "calcstats test";}
  String printStats(List<int> nums){ return "printstats test";}
} // ABSTRACT CLASS (?KINDA???)

String calculation(String cogtype, int totalObtained, int totalNeeded) {

  ICogFacility _icogfacility = cogFacility();
  switch(cogtype) {
    case "Bossbot": _icogfacility = BossbotGolfCourse();
      break;
    case "Lawbot":
      break;
    case "Cashbot":
      break;
    case "Sellbot":
      break;
    default:
      if (kDebugMode) {
        print("ERROR: You should never be here. Something went horribly"
          "wrong with your cogtype, $cogtype");}
    }
  return _icogfacility.calculateStats(totalObtained, totalNeeded);

  // val icogfacility: ICogFacility
  //
  // when(cog){
  //   "Bossbot" -> icogfacility = BossbotGolfCourse()
  //   "Lawbot" -> icogfacility = LawbotDAOffice()
  //   "Cashbot" -> icogfacility = CashbotMint()
  //   "Sellbot" -> icogfacility = SellbotFactory()
  //   else -> {
  //   icogfacility = SellbotFactory() //hacky fix for icogfacility initialization on return line
  //   println("Error: invalid choice; ending program")
  //   System.exit(0)
  //   }
  // }
  // return icogfacility.calculateStats(obtained, needed) //returns String

  // return cogtype + ": " + obtained.toString() + "/" + needed.toString();
  // return "$cogtype: $obtained / $needed";
}
