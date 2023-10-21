import java.util.Scanner;// user input 
/*
 * Mortgage calculator
 */

public class mortgageCalculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);// input scanner
        double loanAmount;// loaned amount
        System.out.println("Enter the loan amount:");
        loanAmount = scanner.nextDouble();
        double interestRate;// interest rate
        System.out.println("Enter the interest rate:");
        interestRate = scanner.nextDouble();
        double loanPeriodYrs;// loan period annaul
        System.out.println("Enter the loan period in years:");
        loanPeriodYrs = scanner.nextDouble();
        calculateMortgage(loanAmount, interestRate, loanPeriodYrs);
        // testSuits();// method test
        scanner.close();
    }

    // caculate mortgage method receives the user inputs (loanAmount, interestRate,
    // loanPeriodYrs) to calculate the Mortgage
    public static void calculateMortgage(double loanAmount, double interestRate, double loanPeriodYrs) {
        double months = 12;
        double interestRatePer = interestRate / 100;// intrest rate percent
        double monthlyRates = interestRatePer / months;// rates per month
        double loanPeriodMths = loanPeriodYrs * months;// losn period months
        double monthlyPaymentsAmount = (monthlyRates * loanAmount) / (1 - Math.pow(1 + monthlyRates, -loanPeriodMths));
        double totalPayment = monthlyPaymentsAmount * loanPeriodMths;
        double totalInterest = totalPayment - loanAmount;
        printMortgageSummary(loanAmount, interestRate, interestRatePer, loanPeriodYrs, monthlyRates, loanPeriodMths,
                monthlyPaymentsAmount, totalPayment, totalInterest);// calling te method

    }

    // printMortgageSummary takes variables calculateMortgage and user input and is
    // used to print out the methods
    public static void printMortgageSummary(double loanAmount, double interestRate, double interestRatePer,
            double loanPeriodYrs, double monthlyRates, double loanPeriodMths, double monthlyPaymentsAmount,
            double totalPayment, double totalInterest) {
        System.out.println("          Here is a summary of your loan based on the data provided:");
        System.out.printf("Loan Amount: %.2f\n", loanAmount);
        System.out.printf("Interest Rate: %.2f%%\n", interestRate);
        System.out.printf("Loan Period: %.0f years\n", loanPeriodYrs);
        System.out.println("          Results for your loan Simulation:");
        System.out.printf("Monthly Payment: %.2f\n", monthlyPaymentsAmount);
        System.out.printf("Total Payment: %.2f\n", totalPayment);
        System.out.printf("Total Intrest Paid: %.2f\n", totalInterest);
        System.out.println("          Thank you for using the Mortgage Calculator!");
        System.out.print("The program terminated normally");

    }

    // testSuits is used to test the equations for calculate mortgage to ensure they
    // work
    public static void testSuits() {
        double test1 = (0.05 * 100) / (1 - Math.pow(1 + 0.05, -360));
        double test2 = (0.04 * 500) / (1 - Math.pow(1 + 0.04, -400));
        System.out.printf("test 1: %.2f", test1);
        System.out.printf("test 2: %.2f", test2);
    }
}