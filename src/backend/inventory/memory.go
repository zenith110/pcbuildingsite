package inventory

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

type Memory struct {
	ID            string `json:"id,omitempty"`
	Name          string `json:"name"`
	Generation    string `json:"generation"`
	Manufacturer  string `json:"manufacturer"`
	Platform      string `json:"platform"`
	Frequency     string `json:"frequency"`
	Sold          bool   `json:"sold"`
	DatePurchased string `json:"datepurchased"`
	DateSold      string `json:"datesold"`
	InStock       bool   `json:"instock"`
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
	if _, err := db.Use("Inventory", "Memory"); err != nil {
		panic(err)
	}
	// Insert memory
	_, err := db.Create("memory", memory)
	if err != nil {
		panic(err)
	}
	return err
}

func GetMemory(memoryId string, db *surrealdb.DB) (Memory, error) {
	if _, err := db.Use("Inventory", "Memory"); err != nil {
		panic(err)
	}
	data, err := db.Select(fmt.Sprintf("memory:%s", memoryId))
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

func DeleteMemory(memoryId string, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "Memory"); err != nil {
		panic(err)
	}
	var err error

	if _, err := db.Delete(fmt.Sprintf("memory:%s", memoryId)); err != nil {
		panic(err)
	}
	return err
}

func GetMemoryInventory(db *surrealdb.DB) (MemoryCollection, error) {
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
