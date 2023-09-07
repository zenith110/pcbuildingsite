package router

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/inventory"
	"github.com/surrealdb/surrealdb.go"
)

func SetUpCpuRouter(app *fiber.App, db *surrealdb.DB) {
	app.Get("/cpu/:cpuid", func(c *fiber.Ctx) error {
		cpuId := c.Params("cpuid")
		data, _ := components.GetCpu(cpuId, db)
		return c.JSON(data)
	})
	app.Get("/cpuInventory/", func(c *fiber.Ctx) error {
		data, _ := components.GetCpuInventory(db)
		return c.JSON(data)
	})
	app.Post("/cpu/", func(c *fiber.Ctx) error {
		data, _ := components.CreateCpu(c, db)
		return c.JSON(data)
	})
	app.Delete("/cpu/:cpuid", func(c *fiber.Ctx) error {
		cpuId := c.Params("cpuid")
		err := components.DeleteCpu(cpuId, db)
		return err
	})
}
