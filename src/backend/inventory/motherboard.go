package inventory

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

type Motherboard struct {
	ID            string `json:"id,omitempty"`
	Name          string `json:"name"`
	Generation    string `json:"generation"`
	Manufacturer  string `json:"manufacturer"`
	Platform      string `json:"platform"`
	Sold          bool   `json:"sold"`
	DatePurchased string `json:"datepurchased"`
	DateSold      string `json:"datesold"`
	InStock       bool   `json:"instock"`
}

type Motherboards struct {
	MotherboardList []Cpu `json:"MotherboardList"`
}

func CreateMotherboard(c *fiber.Ctx, db *surrealdb.DB) (Motherboard, error) {
	if _, err := db.Use("Inventory", "Motherboard"); err != nil {
		panic(err)
	}
	motherboard := new(Motherboard)
	if err := c.BodyParser(motherboard); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	// Insert cpu
	_, err := db.Create("motherboard", motherboard)
	if err != nil {
		panic(err)
	}
	return *motherboard, err
}

func GetMotherboard(c *fiber.Ctx, db *surrealdb.DB) (Motherboard, error) {
	if _, err := db.Use("Inventory", "Motherboard"); err != nil {
		panic(err)
	}
	motherboard := new(Motherboard)
	if err := c.BodyParser(motherboard); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	data, err := db.Select(motherboard.ID)
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedMotherboard := new(Motherboard)
	err = surrealdb.Unmarshal(data, &selectedMotherboard)
	if err != nil {
		panic(err)
	}
	return *selectedMotherboard, err
}

func DeleteMotherboard(c *fiber.Ctx, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "Motherboard"); err != nil {
		panic(err)
	}
	var err error
	motherboard := new(Motherboard)
	if err := c.BodyParser(motherboard); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	if _, err := db.Delete(motherboard.ID); err != nil {
		panic(err)
	}
	return err
}
