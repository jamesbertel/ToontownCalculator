import 'package:flutter/foundation.dart';
import 'cogfacilities/sellbotFacility.dart';
import 'cogfacilities/bossbotFacility.dart';
import 'cogfacilities/cashbotFacility.dart';
import 'cogfacilities/lawbotFacility.dart';

abstract class ICogFacility {
  String calculateStats(int totalObtained, int totalNeeded);
  String printStats(List<int> nums);
} // INTERFACE

class CogFacility extends ICogFacility {
  String calculateStats(int totalObtained, int totalNeeded) { return "calcstats test";}
  String printStats(List<int> nums){ return "printstats test";}
} // ABSTRACT CLASS (?KINDA???)

String calculation(String cogtype, int totalObtained, int totalNeeded) {

  ICogFacility _icogfacility = CogFacility();
  switch(cogtype) {
    case "Bossbot": _icogfacility = BossbotGolfCourse();
      break;
    case "Lawbot": _icogfacility = LawbotDAOffice();
      break;
    case "Cashbot": _icogfacility = CashbotMint();
      break;
    case "Sellbot": _icogfacility = SellbotFactory();
      break;
    default:
      if (kDebugMode) {
        print("ERROR: You should never be here. Something went horribly "
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
