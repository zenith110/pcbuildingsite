package components

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

type Memory struct {
	ID            string `json:"id,omitempty"`
	Name          string `json:"name"`
	Generation    string `json:"surname"`
	Manufacturer  string `json:"manufacturer"`
	Platform      string `json:"platform"`
	Frequency     string `json:"frequency"`
	Sold          bool   `json:"sold"`
	DatePurchased string `json:"datepurchased"`
	DateSold      string `json:"datesold"`
}

type MemoryCollection struct {
	MemoryList []Memory `json:"MemoryList"`
}

func CreateMemory(c *fiber.Ctx, db *surrealdb.DB) error {
	memory := new(Memory)
	if err := c.BodyParser(memory); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	if _, err := db.Use("ComputerParts", "memory"); err != nil {
		panic(err)
	}
	// Insert memory
	_, err := db.Create("memory", memory)
	if err != nil {
		panic(err)
	}
	return err
}

func GetMemory(c *fiber.Ctx, db *surrealdb.DB) (Memory, error) {
	memory := new(Memory)
	if err := c.BodyParser(memory); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	if _, err := db.Use("ComputerParts", "memory"); err != nil {
		panic(err)
	}
	data, err := db.Select(memory.ID)
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedMemory := new(Memory)
	err = surrealdb.Unmarshal(data, &selectedMemory)
	if err != nil {
		panic(err)
	}
	return *selectedMemory, err
}
