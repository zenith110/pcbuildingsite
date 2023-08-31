package pccomponents

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

type Cpu struct {
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

type Cpus struct {
	CpuList []Cpu `json:"CpuList"`
}

func CreateCpu(c *fiber.Ctx, db *surrealdb.DB) (Cpu, error) {
	if _, err := db.Use("ComputerParts", "CPU"); err != nil {
		panic(err)
	}
	cpu := new(Cpu)
	if err := c.BodyParser(cpu); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	// Insert cpu
	_, err := db.Create("cpu", cpu)
	if err != nil {
		panic(err)
	}
	return *cpu, err
}

func GetCpu(c *fiber.Ctx, db *surrealdb.DB) (Cpu, error) {
	if _, err := db.Use("ComputerParts", "CPU"); err != nil {
		panic(err)
	}
	cpu := new(Cpu)
	if err := c.BodyParser(cpu); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	data, err := db.Select(cpu.ID)
	if err != nil {
		panic(err)
	}

	// Unmarshal data
	selectedCpu := new(Cpu)
	err = surrealdb.Unmarshal(data, &selectedCpu)
	if err != nil {
		panic(err)
	}
	return *selectedCpu, err
}

func DeleteCpu(c *fiber.Ctx, db *surrealdb.DB) error {
	if _, err := db.Use("ComputerParts", "CPU"); err != nil {
		panic(err)
	}
	var err error
	cpu := new(Cpu)
	if err := c.BodyParser(cpu); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}
	if _, err := db.Delete(cpu.ID); err != nil {
		panic(err)
	}
	return err
}
