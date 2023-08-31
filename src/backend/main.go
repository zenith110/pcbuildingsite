package backend

import (
	"github.com/gofiber/fiber/v2"
	router "github.com/m/zenith110/pcbuildingsite/router"
)

func main() {
	app := fiber.New()
	db := SignIn()
	router.SetupAllRoutes(app, db)
	app.Listen(":8080")
}
