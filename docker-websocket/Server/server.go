// Create: 2018/11/06 15:55:00 Change: 2018/11/06 15:55:00
// FileName: server.go
// Copyright (C) 2018 lijiaocn <lijiaocn@foxmail.com>
//
// Distributed under terms of the GPL license.
//
// https://github.com/gorilla/websocket/blob/master/examples/echo/server.go

package main

import (
	g_websocket "github.com/gorilla/websocket"
	"golang.org/x/net/websocket"
	"io"
	"log"
	"net/http"
)

func EchoServer(ws *websocket.Conn) {
	println("receive request")
	io.Copy(ws, ws)
}

var upgrader = g_websocket.Upgrader{} // use default options
func echo(w http.ResponseWriter, r *http.Request) {
	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Print("upgrade:", err)
		return
	}
	defer c.Close()
	for {
		mt, message, err := c.ReadMessage()
		if err != nil {
			log.Println("read:", err)
			break
		}
		log.Printf("recv: %s", message)
		err = c.WriteMessage(mt, message)
		if err != nil {
			log.Println("write:", err)
			break
		}
	}
}

func main() {
	http.Handle("/direct", websocket.Handler(EchoServer))
	http.HandleFunc("/echo", echo)
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		panic("ListenAndServer: " + err.Error())
	}
}
