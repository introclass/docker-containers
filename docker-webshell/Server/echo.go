//create: 2015/04/28 13:32:57 Change: 2019/10/16 11:32:30 author:lijiao
package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"io/ioutil"
	"encoding/base64"
)

type Echo struct {
}

type RequestInfo struct{
	RemoteAddr string
	Method string
	Host string
	RequestURI string
	Header http.Header
	Body []byte
}

func (a Echo) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	var resp string

	info := RequestInfo{}

	info.RemoteAddr = r.RemoteAddr
	info.RequestURI = r.RequestURI
	info.Method = r.Method
	info.Host = r.Host
	info.Header = r.Header

	if r.Body != nil{
		body,_ := ioutil.ReadAll(r.Body)
		info.Body,_ = base64.StdEncoding.DecodeString(string(body))
	}

	if bytes, err:= json.MarshalIndent(info,"","    ");err==nil{
		resp = fmt.Sprintf("%s",bytes)
	}else{
		resp = fmt.Sprintf("%s",err.Error())
	}
	log.Printf("%s",resp)
	w.Write([]byte(resp))
}
