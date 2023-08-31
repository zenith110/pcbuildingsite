package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/pccomponents"
	"github.com/surrealdb/surrealdb.go"
)

func SetUpCpuRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/cpu/", func(c *fiber.Ctx) error {
		_, err := components.GetCpu(c, db)
		return err
	})
	app.Post("/cpu/", func(c *fiber.Ctx) error {
		_, err := components.CreateCpu(c, db)
		return err
	})
}
