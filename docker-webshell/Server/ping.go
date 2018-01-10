//create: 2015/04/28 13:32:57 change: 2017/09/06 15:42:33 author:lijiao
package main

import (
	"net/http"
)

type Ping struct {
}

func (a Ping) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	/*
		cookie := Cookie
		http.SetCookie(w,)
	*/
	w.Write([]byte("ok\n"))
}
