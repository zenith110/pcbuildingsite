package inventory

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/surrealdb/surrealdb.go"
)

type Cpu struct {
	ID                     string `json:"id,omitempty"`
	Name                   string `json:"name"`
	GenerationRamSupported string `json:"generationoframsupported"`
	Manufacturer           string `json:"manufacturer"`
	Platform               string `json:"platform"`
	Sold                   bool   `json:"sold"`
	DatePurchased          string `json:"datepurchased"`
	DateSold               string `json:"datesold"`
	InStock                bool   `json:"instock"`
}

type Cpus struct {
	CpuList []Cpu `json:"CpuList"`
}

func CreateCpu(c *fiber.Ctx, db *surrealdb.DB) (Cpu, error) {
	if _, err := db.Use("Inventory", "CPU"); err != nil {
		panic(err)
	}
	cpu := new(Cpu)
	if err := c.BodyParser(cpu); err != nil {
		fmt.Println("error = ", err)
		panic(err)
	}

	// Insert cpu
	data, err := db.Create("cpu", cpu)
	if err != nil {
		panic(err)
	}
	createdUser := make([]Cpu, 1)
	err = surrealdb.Unmarshal(data, &createdUser)

	if err != nil {
		panic(err)
	}
	return *cpu, err
}

func GetCpu(cpuId string, db *surrealdb.DB) (Cpu, error) {
	if _, err := db.Use("Inventory", "CPU"); err != nil {
		panic(err)
	}

	// Get user by ID
	data, err := db.Select(fmt.Sprintf("cpu:%s", cpuId))
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

func DeleteCpu(cpuId string, db *surrealdb.DB) error {
	if _, err := db.Use("Inventory", "CPU"); err != nil {
		panic(err)
	}
	var err error

	if _, err := db.Delete(fmt.Sprintf("cpu:%s", cpuId)); err != nil {
		panic(err)
	}
	return err
}
