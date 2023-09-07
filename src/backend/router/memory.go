package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/inventory"
	"github.com/surrealdb/surrealdb.go"
)

func SetupMemoryRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/memory/:memoryid", func(c *fiber.Ctx) error {
		memoryId := c.Params("memoryid")
		_, err := components.GetMemory(memoryId, db)
		return err
	})
	app.Post("/memory/", func(c *fiber.Ctx) error {
		err := components.CreateMemory(c, db)
		return err
	})
	app.Delete("/memory/memoryid", func(c *fiber.Ctx) error {
		memoryId := c.Params("memoryid")
		err := components.DeleteMemory(memoryId, db)
		return err
	})
}
