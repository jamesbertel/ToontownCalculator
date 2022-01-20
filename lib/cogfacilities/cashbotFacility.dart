import '../calculation.dart';

class CashbotMint implements ICogFacility{

  int x = 0, y = 0, z = 0; //temporary variables
  int a = 0, b = 0, c = 0;

  @override
  String printStats(List<int> nums){
    //TEST:
    //print("You need :\n\t" + nums.get(0) + " to " + nums.get(1) + " bullions,\n\t");
    //print(nums.get(2) + " to " + nums.get(3) + " dollars, and \n\t");
    //print(nums.get(4) + " to " + nums.get(5) + " coins.\n");
    String x;
    x="You need :\n  " + nums[0].toString() + " to " + nums[1].toString() + " bullion(s),\n  ";
    x+=nums[2].toString() + " to " + nums[3].toString() + " dollar(s), and \n  ";
    x+=nums[4].toString() + " to " + nums[5].toString() + " coin(s).\n";
    return x;
  }

  @override
  String calculateStats(int totalObtained, int totalNeeded) {

    List<int> mints = [];
    int total = totalNeeded - totalObtained;

    cashbotsLow(total);
    cashbotsHigh(total);

    //ADD TOTALS TO INTEGER ARRAY
    mints.add(a); //number of min bulls added
    mints.add(x); //number of max bulls added
    mints.add(b); //number of min dollars
    mints.add(y); //number of max dollars added
    mints.add(c); //number of min coins added
    mints.add(z); //number of max coins added
    return printStats(mints);
  }

  void cashbotsLow(int total){

    //CALCULATE MINIMUM BULLS NEEDED
    if (total >= 1202) {
      a = (total / 1202).floor(); //bullions needed
      total = total % 1202; //extra cogbucks
    }
    if(1202 > total && total > 679){
      a++;
      total = total % 1202;
    }

    //CALCULATE MINIMUM DOLLARS NEEDED
    if(total >= 679){
      b = (total / 679).floor(); //dollars needed
      total = total % 679; //extra cogbucks
    }
    if(679 > total && total > 356){
      b++;
      total = total % 679;
    }

    //CALCULATE MINIMUM COINS NEEDED
    if(356 >= total && total > 0){
      c = (total / 356).floor(); //coins needed
      c++;
    }
  }//end cashbotsLow()

  void cashbotsHigh(int total){

    //CALCULATE MAXIMUM BULLS NEEDED
    if (total >= 1496) {
      x = (total / 1496).floor(); //bullions needed
      total = total % 1496; //extra cogbucks
    }
    if(1496 > total && total > 1004){
      x++;
      total = total % 1496;
    }

    //CALCULATE MAXIMUM DOLLARS NEEDED
    if(total >= 1004){
      y = (total / 1004).floor(); //dollars needed
      total = total % 1004; //extra cogbucks
    }
    if(1004 > total && total > 554){
      y++;
      total = total % 1004;
    }

    //CALCULATE MAXIMUM COINS NEEDED
    if(554 >= total && total > 0){
      z = (total / 554).floor(); //coins needed
      z++;
    }
  }//end cashbotsHigh()
}
/*
    TYPE    COGBUCKS EARNED
    Coin    356 - 554
    Dollar  679 - 1004
    Bullion 1202 - 1496
     */
