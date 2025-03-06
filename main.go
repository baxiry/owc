package main

import (
	"embed"
	"fmt"
	"log"
	"net/http"
)

//go:embed static/*
var static embed.FS

func main() {

	http.Handle("/static/", http.FileServer(http.FS(static)))
	//http.Handle("/", http.StripPrefix("/", http.FileServer(http.Dir("static/index.html"))))

	http.HandleFunc("/", index)

	log.Println("Server started at http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func index(w http.ResponseWriter, _ *http.Request) {

	f, err := static.ReadFile("static/index.html")

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		fmt.Println(err.Error())
		return
	}
	fmt.Fprint(w, string(f))
}
