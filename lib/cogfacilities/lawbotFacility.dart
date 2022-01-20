import '../calculation.dart';

class LawbotDAOffice implements ICogFacility {

  @override
  String printStats(List<int> nums){
    //TEST:
    //print("You need:\n\t" + nums.get(0) + " 'D' office(s),\n\t");
    //print(nums.get(1) + " 'C' office(s),\n\t");
    //print(nums.get(2) +" 'B' office(s), and \n\t");
    //print(nums.get(3) + " 'A' office(s).\n");
    String x = "";
    x="You need:\n  " + nums[0].toString() + " 'D' office(s),\n  ";
    x+=nums[1].toString() + " 'C' office(s),\n  ";
    x+=nums[2].toString() +" 'B' office(s), and \n  ";
    x+=nums[3].toString() + " 'A' office(s).\n";
    return x;
  }

  @override
  String calculateStats(int totalObtained, int totalNeeded) {

    List<int> offices = [];
    int a = 0, b = 0, c = 0, d = 0; //temporary variables
    int total = totalNeeded - totalObtained;

    //CALCULATE D OFFICES NEEDED
    if (total >= 1842) {
      d = (total / 1842).floor(); //D Offices Needed
      total = total % 1842; //extra jury notices
    }
    if(1842 > total && total > 1370){
      d++;
      total = total % 1842;
    }

    //CALCULATE C OFFICES NEEDED
    if(total >= 1370){
      c = (total / 1370).floor(); //C Offices Needed
      total = total % 1370; //extra jury notices
    }
    if(1370 > total && total > 944){
      c++;
      total = total % 1270;
    }
    //CALCULATE B OFFICES NEEDED
    if(total >= 944){
      b = (total / 944).floor(); //B Offices Needed
      total = total % 944; //extra jury notices
    }
    if(944 > total && total > 564){
      b++;
      total = total % 944;
    }

    //CALCULATE A OFFICES NEEDED
    if (564 >= total && total > 0){
      a = (total / 564).floor(); //A Offices Needed
      a++;
    }

    //ADD TOTALS TO INTEGER ARRAY
    offices.add(d); //number of D offices added
    offices.add(c); //number of C offices added
    offices.add(b); //number of B offices added
    offices.add(a); //number of A offices added
    return printStats(offices);
  }
}
/*
 TYPE   JURY NOTICES EARNED
    A   564
    B   944
    C   1370
    D   1842
     */
