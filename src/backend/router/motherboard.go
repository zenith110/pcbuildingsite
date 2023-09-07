package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/inventory"
	"github.com/surrealdb/surrealdb.go"
)

func SetupMotherboardRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/motherboard/:motherboardId", func(c *fiber.Ctx) error {
		motherboardId := c.Params("motherboardId")
		_, err := components.GetMotherboard(motherboardId, db)
		return err
	})
	app.Post("/motherboard/", func(c *fiber.Ctx) error {
		_, err := components.CreateMotherboard(c, db)
		return err
	})
	app.Delete("/motherboard/motherboardId", func(c *fiber.Ctx) error {
		motherboardId := c.Params("motherboardId")
		err := components.DeleteMotherboard(motherboardId, db)
		return err
	})
}
