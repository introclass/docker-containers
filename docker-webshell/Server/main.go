//create: 2015/04/28 11:51:41 Change: 2019/06/13 16:02:02 author:lijiao
package main

import (
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

func main() {
	log.SetFlags(log.Llongfile)
	mux := http.NewServeMux()
	mux.Handle("/", Shell{})
	mux.Handle("/ping", Ping{})
	mux.Handle("/cookie", Cookie{})
	idleTimeout, err := strconv.ParseInt(os.Getenv("IDLE_TIMEOUT"), 10, 64)
	if err != nil {
		panic("IDLE_TIMEOUT not interger")
	}
	server := http.Server{Addr: ":8080", Handler: mux, IdleTimeout: time.Duration(idleTimeout) * time.Second}
	log.Fatal(server.ListenAndServe())
}
