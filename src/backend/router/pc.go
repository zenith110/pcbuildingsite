package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/inventory"
	"github.com/surrealdb/surrealdb.go"
)

func SetupComputerRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/computer/computerid", func(c *fiber.Ctx) error {
		computerId := c.Params("computerid")
		_, err := components.GetComputer(computerId, db)
		return err
	})
	app.Post("/computer/", func(c *fiber.Ctx) error {
		_, err := components.CreateComputer(c, db)
		return err
	})
	app.Put("/computer/", func(c *fiber.Ctx) error {
		err := components.UpdateComputer(c, db)
		return err
	})
	app.Delete("/computer/computerid", func(c *fiber.Ctx) error {
		computerId := c.Params("computerid")
		err := components.DeleteComputer(computerId, db)
		return err
	})
}
