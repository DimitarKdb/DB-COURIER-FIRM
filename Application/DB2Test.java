import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DB2Test {

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;


    public void openConnection(){

        try {

            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());

        }

        catch(Exception cnfex) {

            System.out.println("Problem in loading or registering IBM DB2 JDBC driver");

            cnfex.printStackTrace();
        }

        try {

            connection = DriverManager.getConnection("jdbc:db2://62.44.108.24:50000/SAMPLE", "db2admin", "db2admin");

            statement = connection.createStatement();

        }

        catch(SQLException s){

            s.printStackTrace();

        }
    }

    public void closeConnection(){

        try {

            if(null != connection) {


                resultSet.close();
                statement.close();

                connection.close();

            }
        }

        catch (SQLException s) {

            s.printStackTrace();

        }
    }

    public void select(String stmnt, int column) {
        try{
            resultSet = statement.executeQuery(stmnt);
            String result = "";

            while(resultSet.next()) {
                for (int i = 1; i <= column; i++) {

                    result += resultSet.getString(i);

                    if (i == column) result += " \n";
                    else             result += ", ";
                }
            }

            System.out.println("---------------------------------- \n");
            System.out.println("Executing query: " + stmnt + "\n");
            System.out.println("Result output \n");
            System.out.println("---------------------------------- \n");
            System.out.println(result);

        }
        catch (SQLException s)
        {
            s.printStackTrace();
        }

    }

    public void insert(String stmnt) {

        try{
            statement.executeUpdate(stmnt);
            System.out.println("Successfully inserted!");
        }

        catch (SQLException s){
            System.out.println("NOT inserted!");
            s.printStackTrace();
        }

    }

    public void delete(String stmnt) {

        try{

            statement.executeUpdate(stmnt);

        }

        catch (SQLException s){

            s.printStackTrace();

        }

        System.out.println("Successfully deleted!");

    }

    public static int getColumns(String statement) {

        int cols = 1;

        String word = "";

        for (int i = 0; i < statement.length(); i++) {
            word += statement.charAt(i);

            if(statement.charAt(i) == ' ') {
                word = word.trim();
                if (word.equals("FROM")) {
                    return cols;
                } else {
                    word = "";
                }

            }

            if(statement.charAt(i) == ',') {
                cols++;
            }
        }

        return cols;
    }
    public static void selectI(String statement, DB2Test db2Obj) {

        int cols = getColumns(statement);

        db2Obj.select(statement, cols);
    }

    public static void main(String[] args) {

        DB2Test db2Obj = new DB2Test();
        String stmnt = "";

        db2Obj.openConnection();

        //query 1:
        stmnt = "SELECT ADDRESS, EMPLOYEES_CNT FROM " +
                "FN24_8MI0400006.OFFICES " +
                "WHERE ADDRESS like \'789%\'";

        selectI(stmnt, db2Obj);

        //query 2:
        stmnt = "SELECT WORKER_ID, FIRST_NAME, SALARY, OFFICE_NUMBER " +
                "FROM FN24_8MI0400006.DELIVERYWORKERS " +
                "WHERE WORKER_ID IN (\'DW001\', \'DW002\', \'DW003\')";

        selectI(stmnt, db2Obj);

        //query 3:
        stmnt = "SELECT SENDER_UCN, SUM(DELIVERY_FEE) " +
                "FROM FN24_8MI0400006.PACKAGES " +
                "GROUP BY SENDER_UCN " +
                "ORDER BY SUM(DELIVERY_FEE) DESC";

        selectI(stmnt, db2Obj);

        //query 4:
        stmnt = "SELECT ADDRESS, CITY_LOCATION " +
                "FROM FN24_8MI0400006.OFFICES " +
                "WHERE OFFICE_RATING >= 4 " +
                "ORDER BY ADDRESS DESC";

        selectI(stmnt, db2Obj);

        //query 5:
        stmnt = "SELECT FN24_8MI0400006.GETTOTALDELIVERYFEES('3344556677')" +
                "from SYSIBM.SYSDUMMY1";
        selectI(stmnt, db2Obj);


        //query 6:
        stmnt = "SELECT * " +
                "FROM TABLE(FN24_8MI0400006.GETCUSTOMERNAMESANDADDRESSES('3344556677'))";
        db2Obj.select(stmnt,4);


        db2Obj.closeConnection();
    }

}
