package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/COPS-IITBHU/Digital-Entry-System/server/config"
	"github.com/COPS-IITBHU/Digital-Entry-System/server/controllers"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func main() {
	fmt.Println("Starting server...")
	// Initialize router
	router := chi.NewRouter()
	router.Use(middleware.Logger)

	// Initialize Firebase and Database
	config.InitializeFirebase()
	config.InitializeDB()

	router.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Digital Entry System IIT (BHU) Varanasi"))
	})

	// Setup routes
	router.Get("/auth", controllers.GoogleAuth)
	router.Get("/user", controllers.GetUserProfile)

	fmt.Println("Server started at :8888")

	// Start the server
	log.Fatal(http.ListenAndServe(":8888", router))
}
