package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/pccomponents"
	"github.com/surrealdb/surrealdb.go"
)

func SetupMemoryRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/memory/", func(c *fiber.Ctx) error {
		_, err := components.GetMemory(c, db)
		return err
	})
	app.Post("/memory/", func(c *fiber.Ctx) error {
		err := components.CreateMemory(c, db)
		return err
	})
}
