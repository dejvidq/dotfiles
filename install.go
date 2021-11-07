package main

import (
	"fmt"
	"flag"
)

var one string

func main() {
	backup := flag.Bool("backup", false, "Tell script if have to create backup before overriding files")
	st := flag.String("file", "", "list of files separated with space")
    flag.Parse()
    fmt.Println("Backup: ", *backup)
    fmt.Println("file: ", *st)
}

func flags() {
}
