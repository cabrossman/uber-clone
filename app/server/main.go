package main

import (
	db "app/db"
	"fmt"
	"net/http"
	"os"
)

func getDrivers(w http.ResponseWriter, req *http.Request) {
	rows, err := db.Connection.Query("SELECT name FROM drivers")
	if err != nil {
		fmt.Println(err)
	}
	defer rows.Close()

	data := ""
	for rows.Next() {
		var name string
		err = rows.Scan(&name)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println(name)
		data += fmt.Sprintf("%s ", name)
	}

	err = rows.Err()
	if err != nil {
		fmt.Println(err)
	}

	fmt.Fprintf(w, data)
}

func main() {
	db.InitDB()
	defer db.Connection.Close()

	http.Handle("/", http.FileServer(http.Dir("../frontend/build")))
	http.HandleFunc("/drivers", getDrivers)

	serverEnv := os.Getenv("SERVER_ENV")
	if serverEnv == "" {
		fmt.Println("Error: SERVER_ENV environment variable is not set.")
		return
	}

	if serverEnv == "DEV" {
		fmt.Println("Using DEV Port")
		http.ListenAndServe(":8080", nil)

	} else if serverEnv == "PROD" {
		fmt.Println("Using PROD Port")
		http.ListenAndServe(":80", nil)

	}
}
