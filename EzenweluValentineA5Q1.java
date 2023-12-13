
import java.util.Scanner;

public class EzenweluValentineA5Q1 {
    static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        int pointer = 0;// pointer for amount of people listed 
        int[] employeeIDs = new int[1000];// 1000 space 
        String[] employeeNames = new String[1000];
        String[] employeeEmails = new String[1000];
        String[] employeePhoneNumbers = new String[1000];
        String option = showInput();
        System.out.println(option);
         // if not 6 then cases for other numbers 
        while (!option.equals("6")) {
            int intOption = Integer.parseInt(option);
            switch (intOption) {
                case 1:
                    insertUser(employeeIDs, employeeNames, employeeEmails, employeePhoneNumbers, pointer);
                    break;
                case 5:
                    statistics(employeeIDs, employeeNames, employeeEmails, employeePhoneNumbers, pointer);
                    break;
                case 3:
                    search(employeeIDs, employeeNames, employeeEmails, employeePhoneNumbers, pointer);
                    break;
                case 4:
                    update(employeeIDs, employeeNames, employeeEmails, employeePhoneNumbers, pointer);
                    break;
                case 2:
                    delete(employeeIDs, employeeNames, employeeEmails, employeePhoneNumbers, pointer);
                    break;
                default:
                    break;
            }
            if (intOption == 1) {
                pointer++;
            } else if(intOption == 2) {
                pointer--;
            }
            option = showInput();
        }
        scanner.close();
        System.out.println(" ############ Terminated the program ##############");// to exit program 
    }
  // method to show input and return string 
    public static String showInput() {

        System.out.println("#################### PhoneBook Software ########################");
        System.out.println("1. Insert");
        System.out.println("2. Delete");
        System.out.println("3. Search");
        System.out.println("4. Update");
        System.out.println("5. Statistics");
        System.out.println("6. Exit");
        System.out.println(
                "Please enter your option (1 to 6): <<user should enter a number from 1 to 6 (well, user can be clumsy)>>");
        String option = scanner.nextLine();// user input 
        return option;
    }
    // method to insert user input 
    public static void insertUser(int[] employeeIDs, String[] employeeNames, String[] employeeEmails,
            String[] employeePhoneNumbers, int pointer) {
        System.out.println("############# Insert New Employee ################");
        System.out.println("Enter the full name:");
        String name = scanner.nextLine();
        System.out.println("Enter the email address:");
        String email = scanner.nextLine();
        System.out.println("Enter a valid phone number:");
        String phone = scanner.nextLine();
        while (!isValidPhoneNumber(phone)) {//when not a valid number 
            System.out.println("Invalid phone number. Please try again.");// print 

            System.out.println("Enter a valid phone number:");
            phone = scanner.nextLine();

        }
        employeeIDs[pointer] = pointer;
        employeeNames[pointer] = name;
        employeeEmails[pointer] = email;
        employeePhoneNumbers[pointer] = phone;
        System.out.println("############ The employee with the ID 0 is added ###########");

    }
    // valid number method to return a boolean 
    public static boolean isValidPhoneNumber(String phoneNumber) {

        if (phoneNumber.length() != 13) {
            return false;
        }

        if (phoneNumber.charAt(0) != '(' || phoneNumber.charAt(4) != ')' || phoneNumber.charAt(8) != '-') {
            return false;
        }

        for (int i = 1; i < phoneNumber.length(); i++) {
            if (i != 4 && i != 8 && !Character.isDigit(phoneNumber.charAt(i))) {
                return false;
            }
        }
        return true;
    }
   // statistic method to show the number of employee entered 
    public static void statistics(int[] employeeIDs, String[] employeeNames, String[] employeeEmails,
            String[] employeePhoneNumbers, int pointer) {
                System.out.println("######################## Records ######################");
        System.out.printf("ID\t Name\t PhoneNumber\t Email\n");// id, phonenumber, email
        for (int i = 0; i < pointer; i++) {

            System.out.printf(employeeIDs[i] + "\t");
            System.out.printf(employeeNames[i] + "\t");
            System.out.printf(employeeEmails[i] + "\t");
            System.out.printf(employeePhoneNumbers[i] + "\t\n");
        }
        System.out.printf("############### Total existing employees = " + pointer + " ################");


    }
    // search function to find employee details inserted 
    public static void search(int[] employeeIDs, String[] employeeNames, String[] employeeEmails,
            String[] employeePhoneNumbers, int pointer) {
        System.out.println("################ Search An Employee ################");
        System.out.println("Enter the ID to search:");
        String iD = scanner.nextLine();
        if (!Character.isDigit(iD.charAt(0))) {
            System.out.println("Invalid entry");
        }
        int search = searchLogic(employeeIDs, iD, pointer);
       
        if (search == -1) {
            System.out.println("ID not found");
        } else {
            System.out.printf("ID\t Name\t PhoneNumber\t Email\n");
            System.out.printf(employeeIDs[search] + "\t");
            System.out.printf(employeeNames[search] + "\t");
            System.out.printf(employeeEmails[search] + "\t");
            System.out.printf(employeePhoneNumbers[search] + "\t\n");
        }
        
    }

    // method to delete entered employee details 
    public static void delete(int[] employeeIDs, String[] employeeNames, String[] employeeEmails,
            String[] employeePhoneNumbers, int pointer) {
        System.out.println("################ Delete An Employee ################");
        System.out.println("Enter the ID to delete:");
        String iD = scanner.nextLine();
        if (!Character.isDigit(iD.charAt(0))) {
            System.out.println("Invalid entry");
        }
        int search = searchLogic(employeeIDs, iD, pointer);
       
        if (search == -1) {
            System.out.println("ID not found");
        } else {
            deleteAndRearrangeInt(employeeIDs, search);
            deleteAndRearrangeStr(employeeNames, search);
            deleteAndRearrangeStr(employeeEmails, search);
            deleteAndRearrangeStr(employeePhoneNumbers, search);
        }
        System.out.println("#### Successfully deleted employee with ID " + pointer +  " ####");
    }
   // method to delete and arrange the details for intergers
    public static void deleteAndRearrangeInt(int[] array, int indexToDelete) {
        if (indexToDelete < 0 || indexToDelete >= array.length) {
            System.out.println("Invalid index or empty element to delete.");
            return;
        }

        // Delete the element at the specified index
        array[indexToDelete] = 0;

        // Rearrange the array by shifting elements to fill the gap
        for (int i = indexToDelete; i < array.length - 1; i++) {
            array[i] = array[i + 1];
        }
        array[array.length - 1] = 0; // Set the last element to 0

    }
 // method to delete ands arrange for string 
    public static void deleteAndRearrangeStr(String[] array, int indexToDelete) {
        if (indexToDelete < 0 || indexToDelete >= array.length || array[indexToDelete] == "") {
            System.out.println("Invalid index or empty element to delete.");
            return;
        }

        // Delete the element at the specified index
        array[indexToDelete] = "";

        // Rearrange the array by shifting elements to fill the gap
        for (int i = indexToDelete; i < array.length - 1; i++) {
            array[i] = array[i + 1];
        }
        array[array.length - 1] = ""; // Set the last element to 0

    }
  // method to update the detail that is chosen 
    public static void update(int[] employeeIDs, String[] employeeNames, String[] employeeEmails,
            String[] employeePhoneNumbers, int pointer) {
        System.out.println("################ Update An Employee ################");
        System.out.println("Enter the ID to update:");
        String iD = scanner.nextLine();
        if (!Character.isDigit(iD.charAt(0))) {
            System.out.println("Invalid entry");
        }
        int search = searchLogic(employeeIDs, iD, pointer);
       
        if (search == -1) {
            System.out.println("ID not found");
        } else {
            System.out.println("Enter the full name:");
            String name = scanner.nextLine();
            System.out.println("Enter the email address:");
            String email = scanner.nextLine();
            System.out.println("Enter a valid phone number:");
            String phone = scanner.nextLine();
            while (!isValidPhoneNumber(phone)) {
                System.out.println("Invalid phone number. Please try again.");

                System.out.println("Enter a valid phone number:");
                phone = scanner.nextLine();

            }
            employeeNames[search] = name;
            employeeEmails[search] = email;
            employeePhoneNumbers[search] = phone;
        }
        System.out.println("################### The employee with the ID " + pointer +  "is updated ###############");

    }
   // method for search logic
    public static int searchLogic(int[] employeeIDs, String iD, int pointer) {
        int idInt = Integer.parseInt(iD);
        int low = 0;
        int high = pointer - 1;

        while (low <= high) {
            int mid = (low + high) / 2;
            if (employeeIDs[mid] == idInt) {
                return mid;
            } else if (employeeIDs[mid] < idInt) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }

        return -1;

    }

}
