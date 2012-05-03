def addr = args[0]
println "You want to get ${addr}"
URL url = new URL(addr);
URLConnection uc = url.openConnection()

BufferedReader br = new BufferedReader(
	new InputStreamReader(
		uc.getInputStream()))

String inputLine=null

while ((inputLine = br.readLine()) != null)
	println(inputLine)

br.close()
