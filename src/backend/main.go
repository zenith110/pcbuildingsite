package main

import (
	"log"

	"github.com/gofiber/fiber/v2" // swagger handler
	"github.com/joho/godotenv"
	dbComponents "github.com/m/zenith110/pcbuildingsite/db"
	"github.com/m/zenith110/pcbuildingsite/router"
)

func main() {
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatalf("Error loading .env file")
	}
	app := fiber.New()
	db := dbComponents.SignIn()
	router.SetupAllRoutes(app, db)

	app.Listen(":8080")
}
