package main

import (
  "fmt"
  "net/http"
  "os"
)

func getData(w http.ResponseWriter, req *http.Request) {
  fmt.Fprintf(w, "Hello world\n")
}

func main() {
	http.Handle("/", http.FileServer(http.Dir("./static")))
	http.HandleFunc("/data", getData);
	
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