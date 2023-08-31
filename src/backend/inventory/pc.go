package inventory

import (
	"fmt"

	"github.com/gofiber/fiber"
	components "github.com/m/zenith110/pcbuildingsite/inventory"
	"github.com/surrealdb/surrealdb.go"
)

type Computer struct {
	ID            string `json:"id,omitempty"`
	Name          string `json:"name"`
	CPU           []components.Cpu
	Memory        components.Memory
	Fans          []components.Fan
	Psu           components.Psu
	Sold          bool   `json:"sold"`
	DatePurchased string `json:"datepurchased"`
	DateSold      string `json:"datesold"`
	InStock       bool   `json:"instock"`
}

func CreateComputer(c *fiber.Ctx, db *surrealdb.DB) (Computer, error) {
	if _, err := db.Use("Inventory", "Computer"); err != nil {
		panic(err)
	}
	pc := new(Computer)
	if err := c.BodyParser(pc); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	// Insert pc
	_, err := db.Create("Computer", pc)
	if err != nil {
		panic(err)
	}
	return *pc, err
}

func GetComputer(c *fiber.Ctx, db *surrealdb.DB) (Computer, error) {
	if _, err := db.Use("Inventory", "Computer"); err != nil {
		panic(err)
	}
	computer := new(Computer)
	if err := c.BodyParser(computer); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	data, err := db.Select(computer.ID)
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedComputer := new(Computer)
	err = surrealdb.Unmarshal(data, &selectedComputer)
	if err != nil {
		panic(err)
	}
	return *selectedComputer, err
}
