/*Ezenwelu Valentine
 * Basic calculator to add, subtract, divide and multiply
 */

import java.util.Scanner;// user input 

public class basicCalculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);// user input
        double firstNumber;
        System.out.println("Enter the first number:");
        firstNumber = scanner.nextDouble();// user enters input for first number
        double secondNumber;
        System.out.println("Enter the second number:");
        secondNumber = scanner.nextDouble();// user enters input for second number
        // testSuits();// to test all the methods to se if they work properly
        compute(firstNumber, secondNumber);// to compute all the methods
        scanner.close();
    }

    // addition method
    public static double addition(double x, double y) {
        double add = x + y;
        return add;
    }

    // subtraction method
    public static double subtraction(double x, double y) {
        double subtract = x - y;
        return subtract;
    }

    // multiplication method
    public static double multiplication(double x, double y) {
        double multiply = x * y;
        return multiply;
    }

    // division method
    public static double division(double x, double y) {
        double divide = x / y;
        return divide;
    }

    // testing methods
    public static void testSuits() {

        // Testing addition
        System.out.printf("4 + 3 = %.2f \n", addition(4, 3));
        System.out.printf("10.5 + 5 = %.2f \n", addition(10.5, 5));

        // Testing subtraction
        System.out.printf("20 - 8 = %.2f \n", subtraction(20, 8));
        System.out.printf("10 - 7 = %.2f \n", subtraction(10, 7));

        // Testing multiplication
        System.out.printf("5 * 10 = %.2f \n", multiplication(10, 5));
        System.out.printf("0 * 10 = %.2f \n", multiplication(0, 10));

        // Testing division
        System.out.printf("10 / 2 = %.2f \n", division(15, 3));
        System.out.printf("9 / 3 = %.2f \n", division(9, 3));
    }

    // printing calculations methods
    public static void printCalculation(double additionResult, double subtractionResult, double multiplicationResult,
            double divisionResult) {
        System.out.printf("Addition: %.2f \n", additionResult);// addition
        System.out.printf("Subtraction: %.2f \n", subtractionResult);// subtraction
        System.out.printf("Multiplication: %.2f \n", multiplicationResult);// multiplication
        System.out.printf("Division: %.2f \n", divisionResult);// division
        System.out.print("the Program terminated normally.");
    }

    // computing results methods
    public static void compute(double x, double y) {
        double additionResult = addition(x, y);// addition
        double subtractionResult = subtraction(x, y);// subtraction
        double multiplicationResult = multiplication(x, y);// multiplication
        double divisionResult = division(x, y);// dividion
        printCalculation(additionResult, subtractionResult, multiplicationResult, divisionResult);

    }
}