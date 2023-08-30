package main

import (
	"github.com/gofiber/fiber/v2"
	components "github.com/m/zenith110/pcbuildingsite/components"
)

func main() {
	app := fiber.New()
	db := components.SignIn()
	app.Get("/cpu/", func(c *fiber.Ctx) error {
		_, err := components.GetCpu(c, db)
		return err
	})
	app.Post("/cpu/", func(c *fiber.Ctx) error {
		_, err := components.CreateCpu(c, db)
		return err
	})
	app.Get("/memory/", func(c *fiber.Ctx) error {
		_, err := components.GetMemory(c, db)
		return err
	})
	app.Post("/memory/", func(c *fiber.Ctx) error {
		err := components.CreateMemory(c, db)
		return err
	})

	app.Listen(":8080")
}
