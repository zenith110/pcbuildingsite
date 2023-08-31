package inventory

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

type Psu struct {
	ID              string `json:"id,omitempty"`
	Name            string `json:"name"`
	PowerEffeciency string `json:"powereffeciency"`
	Manufacturer    string `json:"manufacturer"`
	TotalWattage    string `json:"totalwattage"`
	Sold            string `json:"sold"`
	DatePurchased   string `json:"datepurchased"`
	DateSold        string `json:"datesold"`
	InStock         string `json:"instock"`
}

type Psus struct {
	PsuList []Psu `json:"PsuList"`
}

func CreatePsu(c *fiber.Ctx, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "Psu"); err != nil {
		panic(err)
	}
	psu := new(Psu)
	if err := c.BodyParser(psu); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	// Insert psu
	_, err := db.Create("psu", psu)
	if err != nil {
		panic(err)
	}
	return err
}

func GetPsu(c *fiber.Ctx, db *surrealdb.DB) (Psu, error) {
	if _, err := db.Use("Inventory", "Psu"); err != nil {
		panic(err)
	}
	psu := new(Psu)
	if err := c.BodyParser(psu); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	data, err := db.Select(psu.ID)
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedPsu := new(Psu)
	err = surrealdb.Unmarshal(data, &selectedPsu)
	if err != nil {
		panic(err)
	}
	return *selectedPsu, err
}

func DeletePsu(c *fiber.Ctx, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "Psu"); err != nil {
		panic(err)
	}
	var err error
	psu := new(Psu)
	if err := c.BodyParser(psu); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	if _, err := db.Delete(psu.ID); err != nil {
		panic(err)
	}
	return err
}

func UpdatePSU(c *fiber.Ctx, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "Psu"); err != nil {
		panic(err)
	}
	psu := new(Psu)
	if err := c.BodyParser(psu); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	data, err := db.Select(psu.ID)
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedPsu := new(Psu)
	err = surrealdb.Unmarshal(data, &selectedPsu)
	if err != nil {
		panic(err)
	}
	// changes := map[string]string{"name": "Jane"}
	// if _, err = db.Change(selectedPsu.ID, changes); err != nil {
	// 	panic(err)
	// }
	return err
}
