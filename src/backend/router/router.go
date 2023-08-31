package router

import (
	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

func SetupAllRoutes(app *fiber.App, db *surrealdb.DB) {
	SetUpCpuRouter(app, db)
	SetupMemoryRouter(app, db)
	SetupPsuRouter(app, db)
	SetupMotherboardRouter(app, db)
}
