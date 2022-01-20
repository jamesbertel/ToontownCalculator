import '../calculation.dart';

class SellbotFactory implements ICogFacility {

  @override
  String printStats(List<int> nums){
    //TEST:
    //print("You need :\n\t" + nums.get(0) + " long(s), and \n\t");
    //println(nums.get(1) + " short(s).");
    String x;
    x="You need :\n" + nums[0].toString() + " long(s), and \n";
    x+=nums[1].toString() + " short(s).";
    return x;
  }

  @override
  String calculateStats(int totalObtained, int totalNeeded) {

    List<int> factories = [];
    int x = 0, y = 0; //temporary variables
    int total = totalNeeded - totalObtained;

    //CALCULATE LONGS NEEDED
    if(total >= 776){
      x = (total / 776).floor(); //longs needed
      total = total % 776; //extra merits
    }

    //CALCULATE SHORTS NEEDED
    if(480 >= total && total > 0){
      y = (total / 480).floor(); //shorts needed
      y++;
    }

    //ADD TOTALS TO INTEGER ARRAY
    factories.add(x); //number of longs added
    factories.add(y); //number of shorts added
    return printStats(factories);
  }
}

/*
    TYPE    MERITS EARNED
    Short   480
    Long    776
     */