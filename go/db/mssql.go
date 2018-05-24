package main

//https://sqlchoice.azurewebsites.net/en-us/sql-server/developer-get-started/go/rhel/step/2.html

import (
	"context"
	"database/sql"
	"fmt"
	"log"

	_ "github.com/denisenkom/go-mssqldb"
)

// Replace with your own connection parameters
var server = "localhost\\sql2017"
var port = 1433
var user = "david"
var password = "david"
var database = "blogdemos"

var db *sql.DB

func main() {
	var err error

	// Create connection string
	connString := fmt.Sprintf("server=%s;user id=%s;password=%s;port=%d;database=%s",
		server, user, password, port, database)

	// Create connection pool
	db, err = sql.Open("sqlserver", connString)
	if err != nil {
		log.Fatal("Error creating connection pool: " + err.Error())
	}
	log.Printf("Connected!\n")

	// Close the database connection pool after program executes
	defer db.Close()

	SelectVersion()
	ReadEmployees()
	UpdateEmployee("George", 3)
	DeleteEmployee(1)
	fmt.Println("----------------")
	CreateEmployee("John Adams")
	ReadEmployees()
}

// SelectVersion Gets and prints SQL Server version
func SelectVersion() {
	// Use background context
	ctx := context.Background()

	// Ping database to see if it's still alive.
	// Important for handling network issues and long queries.
	err := db.PingContext(ctx)
	if err != nil {
		log.Fatal("Error pinging database: " + err.Error())
	}

	var result string

	// Run query and scan for result
	err = db.QueryRowContext(ctx, "SELECT @@version").Scan(&result)
	if err != nil {
		log.Fatal("Scan failed:", err.Error())
	}
	fmt.Printf("%s\n", result)
}

func CreateEmployee(StudentName string) (int64, error) {
	ctx := context.Background()
	var err error

	if db == nil {
		log.Fatal("What?")
	}

	// Check if database is alive.
	err = db.PingContext(ctx)
	if err != nil {
		log.Fatal("Error pinging database: " + err.Error())
	}

	tsql := fmt.Sprintf("INSERT INTO [dbo].[Student] (StudentName) VALUES (@StudentName);")

	// Execute non-query with named parameters
	result, err := db.ExecContext(
		ctx,
		tsql,
		sql.Named("StudentName", StudentName))

	if err != nil {
		log.Fatal("Error inserting new row: " + err.Error())
		return -1, err
	}

	return result.LastInsertId()
}

func ReadEmployees() (int, error) {
	ctx := context.Background()

	// Check if database is alive.
	err := db.PingContext(ctx)
	if err != nil {
		log.Fatal("Error pinging database: " + err.Error())
	}

	tsql := fmt.Sprintf("SELECT StudentName FROM [dbo].[Student];")

	// Execute query
	rows, err := db.QueryContext(ctx, tsql)
	if err != nil {
		log.Fatal("Error reading rows: " + err.Error())
		return -1, err
	}

	defer rows.Close()

	var count int = 0

	// Iterate through the result set.
	for rows.Next() {
		var studentName string

		// Get values from row.
		err := rows.Scan(&studentName)
		if err != nil {
			log.Fatal("Error reading rows: " + err.Error())
			return -1, err
		}

		fmt.Printf("Student Name: %s\n", studentName)
		count++
	}

	return count, nil
}

// Update an employee's information
func UpdateEmployee(StudentName string, StudentID int) (int64, error) {
	ctx := context.Background()

	// Check if database is alive.
	err := db.PingContext(ctx)
	if err != nil {
		log.Fatal("Error pinging database: " + err.Error())
	}

	tsql := fmt.Sprintf("UPDATE [dbo].Student SET StudentName = @StudentName WHERE StudentID= @StudentID")

	// Execute non-query with named parameters
	result, err := db.ExecContext(
		ctx,
		tsql,
		sql.Named("StudentName", StudentName),
		sql.Named("StudentID", StudentID))
	if err != nil {
		log.Fatal("Error updating row: " + err.Error())
		return -1, err
	}

	return result.LastInsertId()
}

// Delete an employee from database
func DeleteEmployee(StudentID int) (int64, error) {
	ctx := context.Background()

	// Check if database is alive.
	err := db.PingContext(ctx)
	if err != nil {
		log.Fatal("Error pinging database: " + err.Error())
	}

	tsql := fmt.Sprintf("DELETE FROM [dbo].[Student] WHERE StudentID=@StudentID;")

	// Execute non-query with named parameters
	result, err := db.ExecContext(ctx, tsql, sql.Named("StudentID", StudentID))
	if err != nil {
		fmt.Println("Error deleting row: " + err.Error())
		return -1, err
	}

	return result.RowsAffected()
}
