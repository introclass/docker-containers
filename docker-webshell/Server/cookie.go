//create: 2017/09/06 15:45:35 change: 2017/09/06 17:17:04 author:lijiao
package main

import (
	"log"
	"net/http"
	"os"
)

type Cookie struct {
}

func (a Cookie) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	var cookie *http.Cookie
	log.Printf("%s\n", r.Cookies())
	value := r.FormValue("v")
	if value == "" {
		w.Write([]byte("value not set\n"))
		return
	}

	name := r.FormValue("n")
	if value == "" {
		hostname, err := os.Hostname()
		if err != nil {
			hostname = "no-name"
		}
		name = hostname
	}

	cookie = &http.Cookie{Name: name, Value: value}
	http.SetCookie(w, cookie)
	w.Write([]byte(cookie.String()))
}
