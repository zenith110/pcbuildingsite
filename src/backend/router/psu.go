package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/pccomponents"
	"github.com/surrealdb/surrealdb.go"
)

func SetupPsuRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/psu/", func(c *fiber.Ctx) error {
		_, err := components.GetPsu(c, db)
		return err
	})
	app.Post("/psu/", func(c *fiber.Ctx) error {
		err := components.CreatePsu(c, db)
		return err
	})
}
