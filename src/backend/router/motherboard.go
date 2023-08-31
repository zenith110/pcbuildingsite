package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/pccomponents"
	"github.com/surrealdb/surrealdb.go"
)

func SetupMotherboardRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/motherboard/", func(c *fiber.Ctx) error {
		_, err := components.GetMotherboard(c, db)
		return err
	})
	app.Post("/motherboard/", func(c *fiber.Ctx) error {
		_, err := components.CreateMotherboard(c, db)
		return err
	})
}
