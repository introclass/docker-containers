//create: 2015/04/28 11:51:41 change: 2017/09/06 15:45:21 author:lijiao
package main

import (
	"log"
	"net/http"
)

func main() {
	log.SetFlags(log.Llongfile)
	mux := http.NewServeMux()
	mux.Handle("/", Shell{})
	mux.Handle("/ping", Ping{})
	mux.Handle("/cookie", Cookie{})
	server := http.Server{Addr: ":8080", Handler: mux}
	log.Fatal(server.ListenAndServe())
}
