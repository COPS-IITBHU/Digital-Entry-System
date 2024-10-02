package controllers

import (
	"context"
	"encoding/json"
	"net/http"

	"github.com/COPS-IITBHU/Digital-Entry-System/server/config"
	"github.com/COPS-IITBHU/Digital-Entry-System/server/models"
	"github.com/COPS-IITBHU/Digital-Entry-System/server/utils"
)

// GoogleAuth handles Firebase Authentication and generates a JWT token
func GoogleAuth(w http.ResponseWriter, r *http.Request) {
	idToken := r.Header.Get("Authorization")
	if idToken == "" {
		http.Error(w, "Authorization header missing", http.StatusBadRequest)
		return
	}

	token, err := config.FirebaseAuth.VerifyIDToken(context.Background(), idToken)
	if err != nil {
		http.Error(w, "Invalid Firebase ID token", http.StatusUnauthorized)
		return
	}

	user := models.User{
		ID:    token.UID,
		Email: token.Claims["email"].(string),
		Name:  token.Claims["name"].(string),
	}

	if err := config.DB.Where(models.User{ID: user.ID}).FirstOrCreate(&user).Error; err != nil {
		http.Error(w, "Failed to save user", http.StatusInternalServerError)
		return
	}

	tokenString, err := utils.CreateJWT(user.ID)
	if err != nil {
		http.Error(w, "Failed to create token", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]string{"token": tokenString})
}
