
import java.util.Scanner;// user input 

public class caloriescalculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int caloriesPerFruit = 115;// user should changer the 155 to calories for eaten fruit.
        int numOfFruit;// number of fruit consumed
        System.out.println("How many fruits did you eat? ");
        numOfFruit = scanner.nextInt();// input function

        int totalCalories;// total calories

        totalCalories = caloriesPerFruit * numOfFruit;// equation for total calories
        System.out.println("the number of fruits entered contains a total of " + totalCalories + " calories.");
        int weightPounds1 = 130;// first weight in pounds
        int weightPounds2 = 190;// second weight in pounds
        int caloriesBurned1 = 207;// first calories burned
        int caloriesBurned2 = 302;// second calories burned
        int slope = (caloriesBurned2 - caloriesBurned1) / (weightPounds2 - weightPounds1);// slope
        double yIntercept = caloriesBurned2 - (slope * weightPounds2);// equation for y intercept
        double userWeightKg;// user wight in kilogram
        System.out.println("How much do you weigh, in kg? ");
        userWeightKg = scanner.nextDouble();
        double weightInpounds = 2.2;// value for weight in pounds
        double userWeightPounds = userWeightKg * weightInpounds;// equation for user weight in pounds
        double caloriesBurnedRate = slope * userWeightPounds + yIntercept;// equation for calories burned rate
        double minute = 60;// value for minutes
        double caloriesBurnedPerMinute = caloriesBurnedRate / minute;// equation for calories burned per minute
        System.out.printf("You are " + userWeightKg + " kilograms or  %.2f pounds.\n", userWeightPounds);
        System.out.printf("When walking you consume  %.2f calories per minute.\n", caloriesBurnedPerMinute);
        double minutesWalked = totalCalories / caloriesBurnedPerMinute;
        System.out.printf("When walking, you consume %.2f calories per minute.\n", minutesWalked);
        double hoursWalked = minutesWalked / minute;// equation for hous walked
        double walkingSpeed = 3.0;// value for wlking speed
        double kilometers = 1.6;// value for kilometer
        double distancWalked = hoursWalked * walkingSpeed;// equation for distance walked
        double distanceWalkedKm = distancWalked * kilometers;// equation for distance walked in kilometers
        double meter1 = 1000.00;// value for meter 1
        double distanceWalkedMeter = distanceWalkedKm * meter1;// equation for distance walked in meters
        System.out.printf("You would be able to work %.2f minutes if you ate " + numOfFruit + " fruits.\n",
                minutesWalked);
        System.out.printf("You would be able to walk %.2f km.\n", distanceWalkedKm);
        double userHeight;// user height
        System.out.println("How tall are you, in cm? ");
        userHeight = scanner.nextDouble();// input function
        double meter2 = 0.01;// value of meter 2
        double userHeightMeters = userHeight * meter2;// equation for user height in meter
        double ratioOfHeight = 0.43;// ratio of height
        double strideLength = userHeightMeters * ratioOfHeight;// equation for stride length
        double numOfSteps = distanceWalkedMeter / strideLength;// equation of number of steps
        System.out.printf("In that time you will take %.0f steps.\n", numOfSteps);
        double lapDiameter;// lap diameter
        System.out.println("What is the track diameter, in meters? ");
        lapDiameter = scanner.nextDouble();// user input
        double lapCircumfrence = lapDiameter * Math.PI;// equation for lap circumference
        double numOfLaps = distanceWalkedMeter / lapCircumfrence;// equation for number of laps
        System.out.printf("You will take %.2f laps around the track.\n", numOfLaps);
        System.out.print("Program terminated normally.");
        scanner.close();// user input closed

    }
}