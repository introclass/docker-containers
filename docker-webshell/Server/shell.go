//create: 2016/04/04 15:34:22 change: 2016/04/04 17:30:46 author:lijiao
package main

import (
	"net/http"
	"strings"
	"html/template"
	"log"
	"os/exec"
	"bytes"
)

type Shell struct{
}
type Result  struct{
	Command string
	Params  string
	Stdout  string
	Stderr  string
}

func (a Shell)ServeHTTP(w http.ResponseWriter, r *http.Request){
	t, err := template.ParseFiles("./webshell.gtpl")
	if err != nil {
		log.Print(err)
		return
	}

	cmd := "hostname"
	var params []string
	if r.Method == "POST" {
		r.ParseForm()
		cmd = strings.TrimSpace(r.Form.Get("command"))
		params = strings.Fields(r.Form.Get("params"))
	}

	var sh *exec.Cmd
	if len(params) == 0{
		sh = exec.Command(cmd)
	}else{
		sh = exec.Command(cmd, params...)
	}
	var stdout bytes.Buffer
	var stderr bytes.Buffer
	sh.Stdout = &stdout
	sh.Stderr = &stderr

	err = sh.Run()

	t.Execute(w,
		Result{Command:cmd,
			Params: r.Form.Get("params"),
			Stdout: stdout.String(),
			Stderr:stderr.String()})
}
