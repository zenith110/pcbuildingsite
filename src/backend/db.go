package backend

import (
	"fmt"
	"os"

	"github.com/surrealdb/surrealdb.go"
)

func SignIn() *surrealdb.DB {
	db, err := surrealdb.New(fmt.Sprintf("ws://%s/rpc", os.Getenv("DBHOST")))
	if err != nil {
		panic(err)
	}

	if _, err = db.Signin(map[string]interface{}{
		"user": os.Getenv("DBUSERNAME"),
		"pass": os.Getenv("DBPASSWORD"),
	}); err != nil {
		panic(err)
	}

	return db
}
