package controllers

import (
	"encoding/json"
	"net/http"

	"github.com/COPS-IITBHU/Digital-Entry-System/server/config"
	"github.com/COPS-IITBHU/Digital-Entry-System/server/models"
	"github.com/COPS-IITBHU/Digital-Entry-System/server/utils"
)

func GetUserProfile(w http.ResponseWriter, r *http.Request) {
	authHeader := r.Header.Get("Authorization")
	if authHeader == "" {
		http.Error(w, "Authorization header missing", http.StatusBadRequest)
		return
	}

	tokenString := authHeader[len("Bearer "):]

	claims, err := utils.VerifyJWT(tokenString)
	if err != nil {
		http.Error(w, "Invalid token", http.StatusUnauthorized)
		return
	}

	var user models.User
	if err := config.DB.First(&user, "id = ?", claims.UID).Error; err != nil {
		http.Error(w, "User not found", http.StatusNotFound)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(user)
}
