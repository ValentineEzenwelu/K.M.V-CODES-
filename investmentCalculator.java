import java.util.Scanner;// user input 
/*
 * 
 * Investment calculator
 */

public class investmentCalculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double investmentAmount;// amount of investment
        System.out.println("Enter the initial investment amount:");
        investmentAmount = scanner.nextDouble();
        double interestRate;// rate of interest
        System.out.println("Enter the annual intrest rate:");
        interestRate = scanner.nextDouble();
        double yrsOfInvestment;// number of years of investment
        System.out.println("Enter the number of years for the investment:");
        yrsOfInvestment = scanner.nextDouble();
        double averageInflationRate;// infltion rate
        System.out.println("Enter the inflation rate");
        averageInflationRate = scanner.nextDouble();
        summaryOfInvestment(investmentAmount, interestRate, yrsOfInvestment, averageInflationRate);// calling method
        // testSuits();
        scanner.close();
    }

    // calculateCompoundInterest returns compound interest and recieves input from
    // user inputs
    public static double calculateCompundInterest(double investmentAmount, double interestRate,
            double yrsOfInvestment) {
        double compoundInterest = investmentAmount * Math.pow(1 + interestRate / 100, yrsOfInvestment);
        return compoundInterest;// equation for compound interest

    }

    // summeryOfInvestment recieves input from user and averageInflationRate and
    // complies and prints them out in output
    public static void summaryOfInvestment(double investmentAmount, double interestRate, double yrsOfInvestment,
            double averageInflationRate) {
        double compoundInterest1 = calculateCompundInterest(investmentAmount, interestRate, yrsOfInvestment);// assigning
                                                                                                             // return
                                                                                                             // value
        double gainInterest = compoundInterest1 - investmentAmount;// equation for gained interest
        double inflation1 = adjustForInflation(averageInflationRate, compoundInterest1, yrsOfInvestment,
                investmentAmount);// assiging return value
        double inflationInterest = inflation1 - investmentAmount;// equation for inflation interest
        System.out.println("              Summary of your investment based on data provided:");
        System.out.printf("Initial investment amount: %.2f\n", investmentAmount);
        System.out.printf("Annual interest rate: %.2f%%\n", interestRate);
        System.out.printf("Number of years for the investment: %.2f\n", yrsOfInvestment);
        System.out.printf("Total gain from interest: %.2f\n", gainInterest);
        System.out.printf("Total amount after interest: %.2f\n", compoundInterest1);
        System.out.println("              Impact of inflation on investment:");
        System.out.printf("Total gain from interest (adjusted for inflation): %.2f\n", inflationInterest);
        System.out.printf("Total amount after investment (adjusted for inflation): %.2f\n", inflation1);
        System.out.print("The program terminated normally.");

    }

    // testSuits tests all the equations from calculate comepound interest
    public static void testSuits() {
        double testResult1 = 100 * Math.pow(1 + 12 / 100, 30);
        double testResult2 = 200 * Math.pow(1 + 20 / 100, 10);
        System.out.printf("test result 1: %.2f", testResult1);// test 1
        System.out.printf("test result 2: %.2f", testResult2);// test
        double test1 = 2000 * Math.pow(1 - 4.73, 30);
        double test2 = 1000 * Math.pow(1 - 5.22, 40);
        System.out.printf("test 1: %.2f", test1);// test 1
        System.out.printf("test 2: %.2f", test2);// tets 2

    }

    // adjust for inflation recveivesinput from calculate compund interest and
    // returns inflation
    public static double adjustForInflation(double averageInflationRate, double compoundInterest,
            double yrsOfInvestment, double investmentAmount) {
        double inflation = compoundInterest * Math.pow(1 - averageInflationRate / 100, yrsOfInvestment);
        return inflation;
    }
}