package components

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

type Fan struct {
	ID            string `json:"id,omitempty"`
	Name          string `json:"name"`
	Manufacturer  string `json:"manufacturer"`
	FanSize       string `json:"fansize"`
	Sold          bool   `json:"sold"`
	DatePurchased string `json:"datepurchased"`
	DateSold      string `json:"datesold"`
}

type Fans struct {
	FanList []Cpu `json:"FanList"`
}

func CreateFan(c *fiber.Ctx, db *surrealdb.DB) (Fan, error) {
	if _, err := db.Use("ComputerParts", "Fan"); err != nil {
		panic(err)
	}
	fan := new(Fan)
	if err := c.BodyParser(fan); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	// Insert cpu
	_, err := db.Create("fan", fan)
	if err != nil {
		panic(err)
	}
	return *fan, err
}

func GetFan(c *fiber.Ctx, db *surrealdb.DB) (Fan, error) {
	if _, err := db.Use("ComputerParts", "Fan"); err != nil {
		panic(err)
	}
	fan := new(Fan)
	if err := c.BodyParser(fan); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	data, err := db.Select(fan.ID)
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedFan := new(Fan)
	err = surrealdb.Unmarshal(data, &selectedFan)
	if err != nil {
		panic(err)
	}
	return *selectedFan, err
}

func DeleteFan(c *fiber.Ctx, db *surrealdb.DB) error {
	if _, err := db.Use("ComputerParts", "Fan"); err != nil {
		panic(err)
	}
	var err error
	fan := new(Fan)
	if err := c.BodyParser(fan); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	if _, err := db.Delete(fan.ID); err != nil {
		panic(err)
	}
	return err
}
