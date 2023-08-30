package backend

import (
	components "github.com/m/zenith110/pcbuildingsite/components"
)

type Computer struct {
	CPU    []components.Cpu
	Memory components.Memory
	Fans   []components.Fan
	Psu    components.Psu
}
