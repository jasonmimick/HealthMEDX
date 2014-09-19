class HMXDEMO.ProductionMonitor extends (%CSP.Page)
{

parameter CONTENTTYPE = "application/json";
classmethod OnPage() As %Status
{
	//write %request.CgiEnvs
	set ns=$get(%request.CgiEnvs("HTTP_X_NAMESPACE"),$namespace)
	new $namespace
	set $namespace=ns
	// going to return a JSON array of objects
	write "[",!
	set objects = ##class(%ListOfObjects).%New()
	set sysInfo = ##class(%ZEN.proxyObject).%New()
	set sysInfo.InstanceName = ##class(%SYS.System).GetInstanceName()
	set sysInfo.TimeStamp = $zdt($zts)
	set sysInfo.HostComputerName = $SYSTEM.INetInfo.LocalHostName()
	do objects.Insert(sysInfo)

	set activeProductionName = ##class(Ens.Director).GetActiveProductionName()
	set production = ##class(Ens.Config.Production).%OpenId(activeProductionName)	
	do objects.Insert(production)
	
	write "objects.Count()=",objects.Count(),!
	for i=1:1:objects.Count() {
		set object = objects.GetAt(i)
		kill stream
		set sc=##class(Ens.Util.JSON).ObjectToJSONStream(object,.stream)
		do stream.Rewind()
		while ( 'stream.AtEnd ) {
			write stream.Read()
		}
		write ",",!
	}	
	set rs=##class(%ResultSet).%New("Ens.Queue:Enumerate")
	set sc=rs.Execute()
	write "{",!
	set next=rs.Next()
	do {
		write """",rs.Get("Name"),""":",rs.Get("Count")
		set next=rs.Next()
		if ( next ) { write ",",! }
		else { write ! }
	} while ( next ) 
	write "}",!
	write "]",!
	quit $$$OK
}
}
