package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/inventory"
	"github.com/surrealdb/surrealdb.go"
)

func SetupComputerRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/computer/", func(c *fiber.Ctx) error {
		_, err := components.GetComputer(c, db)
		return err
	})
	app.Post("/computer/", func(c *fiber.Ctx) error {
		_, err := components.CreateComputer(c, db)
		return err
	})
}
