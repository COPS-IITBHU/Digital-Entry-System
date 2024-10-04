package config

import (
	"context"
	"log"

	firebase "firebase.google.com/go"
	"firebase.google.com/go/auth"
	"github.com/COPS-IITBHU/Digital-Entry-System/server/models"
	"github.com/glebarez/sqlite"
	"google.golang.org/api/option"
	"gorm.io/gorm"
)

var FirebaseAuth *auth.Client
var DB *gorm.DB

func InitializeFirebase() {
	firebaseOptions := option.WithCredentialsFile("serviceAccountKey.json")
	app, err := firebase.NewApp(context.Background(), nil, firebaseOptions)
	if err != nil {
		log.Fatalf("error initializing firebase app: %v\n", err)
	}
	FirebaseAuth, err = app.Auth(context.Background())
	if err != nil {
		log.Fatalf("error initializing Firebase Auth: %v", err)
	}
}

func InitializeDB() {
	DB, err := gorm.Open(sqlite.Open("database.db"), &gorm.Config{})
	if err != nil {
		log.Fatalf("failed to connect to database: %v", err)
	}

	// Auto-migrate User schema
	if err := DB.AutoMigrate(&models.User{}); err != nil {
		log.Fatalf("Auto migration failed: %v", err)
	}
}
