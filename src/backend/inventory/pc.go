package inventory

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

type Computer struct {
	ID            string `json:"id,omitempty"`
	Name          string `json:"name"`
	CPU           []Cpu
	Memory        Memory
	Fans          []Fan
	Psu           Psu
	Sold          bool   `json:"sold"`
	DatePurchased string `json:"datepurchased"`
	DateSold      string `json:"datesold"`
	InStock       bool   `json:"instock"`
}
type ComputerInventory struct {
	ComputerList []Computer `json:"computerlist,omitempty"`
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
	_, err := db.Create("computer", pc)
	if err != nil {
		panic(err)
	}
	return *pc, err
}

func GetComputer(computerId string, db *surrealdb.DB) (Computer, error) {
	if _, err := db.Use("Inventory", "Computer"); err != nil {
		panic(err)
	}

	data, err := db.Select(fmt.Sprintf("computer:%s", computerId))
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

func UpdateComputer(c *fiber.Ctx, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "Computer"); err != nil {
		panic(err)
	}
	computer := new(Computer)
	if err := c.BodyParser(computer); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	data, err := db.Select(fmt.Sprintf("computer:%s", computer.ID))
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedComputer := new(Computer)
	err = surrealdb.Unmarshal(data, &selectedComputer)
	if err != nil {
		panic(err)
	}
	// changes := map[string]string{"name": "Jane"}
	// if _, err = db.Change(selectedComputer.ID, changes); err != nil {
	// 	panic(err)
	// }
	return err
}

func DeleteComputer(computerId string, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "Computer"); err != nil {
		panic(err)
	}
	var err error
	if _, err := db.Delete(fmt.Sprintf("computer:%s", computerId)); err != nil {
		panic(err)
	}
	return err
}

func GetComputerInventory(db *surrealdb.DB) (ComputerInventory, error) {
	if _, err := db.Use("Inventory", "Computer"); err != nil {
		panic(err)
	}
	data, err := db.Select("computer")
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	computerInventory := new(ComputerInventory)
	err = surrealdb.Unmarshal(data, &computerInventory.ComputerList)
	if err != nil {
		panic(err)
	}
	return *computerInventory, err
}
