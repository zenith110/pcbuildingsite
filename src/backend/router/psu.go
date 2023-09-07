package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/inventory"
	"github.com/surrealdb/surrealdb.go"
)

func SetupPsuRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/psu/psuid", func(c *fiber.Ctx) error {
		psuId := c.Params("psuid")
		_, err := components.GetPsu(psuId, db)
		return err
	})
	app.Post("/psu/", func(c *fiber.Ctx) error {
		err := components.CreatePsu(c, db)
		return err
	})
	app.Put("/psu/", func(c *fiber.Ctx) error {
		err := components.UpdatePSU(c, db)
		return err
	})
	app.Delete("/psu/psuid", func(c *fiber.Ctx) error {
		psuId := c.Params("psuid")
		err := components.DeletePsu(psuId, db)
		return err
	})
}
