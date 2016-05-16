package main

import (
	"log"

	"upper.io/db.v2"
	"upper.io/db.v2/postgresql" // Imports the postgresql adapter.
)

var settings = postgresql.ConnectionURL{
	Database: `booktown`,
	Host:     `demo.upper.io`,
	User:     `demouser`,
	Password: `demop4ss`,
}

// Customer represents a customer.
type Customer struct {
	ID        uint   `db:"id"`
	FirstName string `db:"first_name"`
	LastName  string `db:"last_name"`
}

func main() {
	sess, err := postgresql.Open(settings)
	if err != nil {
		log.Fatal(err)
	}
	defer sess.Close()

	res := sess.Collection("customers").Find().Sort("last_name")
	defer res.Close()

	log.Println("Our customers:")

	for {
		var customer Customer
		if err := res.Next(&customer); err != nil {
			if err != db.ErrNoMoreRows {
				log.Fatal(err)
			}
			break
		}
		log.Printf("%d: %s, %s\n", customer.ID, customer.LastName, customer.FirstName)
	}

}