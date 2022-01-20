import '../calculation.dart';

class BossbotGolfCourse implements ICogFacility {

  @override
  String printStats(List<int> nums){
    //TEST:
    //print("You need :\n\t" + nums.get(0) + " back nine(s),\n\t");
    //print(nums.get(1) + " middle six(es), and \n\t");
    //print(nums.get(2) + " front three(s).\n");
    String x = "";
    x="You need :\n  " + nums[0].toString() + " back nine(s),\n";
    x+=nums[1].toString() + " middle six(es), and \n";
    x+=nums[2].toString() + " front three(s).\n";
    return x;
  }

  @override
  String calculateStats(int totalObtained, int totalNeeded) {

    List<int> golfCourses = [];
    int x = 0, y = 0, z = 0; //temporary variables
    int total = totalNeeded - totalObtained;

    //CALCULATE BACK NINES NEEDED
    if (total >= 3350) {
      x = (total / 3350).floor() ; //back nines needed
      total = total % 3350; //extra stock options
    }
    if(3350 > total && total > 1874){
      x++;
      total = total - 3550;
    }

    //CALCULATE MIDDLE SIXES NEEDED
    if(total >= 1874){
      y = (total / 1874).floor() ; //middle sixes needed
      total = total % 1874; //extra stock options
    }
    if(1874 > total && total > 764){
      y++;
      total = total % 1874;
    }

    //CALCULATE FRONT THREES NEEDED
    if (764 >= total && total > 0){
      z = (total / 764).floor() ; //front threes needed
      z++;
    }

    //ADD TOTALS TO INTEGER ARRAY
    golfCourses.add(x); //number of back nines added
    golfCourses.add(y); //number of middle sixes added
    golfCourses.add(z); //number of front threes added
    return printStats(golfCourses);
  }
}

/*
    TYPE            STOCK OPTIONS
    Front Three     764
    Middle Six      1874
    Back Nine       3350
     */
