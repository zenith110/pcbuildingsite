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

func GetMotherboard(motherboardId string, db *surrealdb.DB) (Motherboard, error) {
	if _, err := db.Use("Inventory", "Motherboard"); err != nil {
		panic(err)
	}

	data, err := db.Select(fmt.Sprintf("motherboard:%s", motherboardId))
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

func DeleteMotherboard(motherboardId string, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "Motherboard"); err != nil {
		panic(err)
	}
	var err error
	if _, err := db.Delete(fmt.Sprintf("motherboard:%s", motherboardId)); err != nil {
		panic(err)
	}
	return err
}

func GetMotherboardInventory(db *surrealdb.DB) (MemoryCollection, error) {
	if _, err := db.Use("Inventory", "Memory"); err != nil {
		panic(err)
	}
	data, err := db.Select("memory")
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedMemory := new(MemoryCollection)
	err = surrealdb.Unmarshal(data, &selectedMemory.MemoryList)
	if err != nil {
		panic(err)
	}
	return *selectedMemory, err
}
