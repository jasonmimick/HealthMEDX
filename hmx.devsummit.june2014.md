HealthMEDX Development Summit June 2014
=======================================


TODO's / Topics / Open Items
----------------------------

* Need to build benchmark/load testing tools to help dev, test, and ops
* Big messages ~ >1K with the CIM, how does that effect settings? (need baseline)
* SNMP - MIB should check global refs/second and cache hit ratio (higher better)
* Solarwinds - seems there are some extensibility hooks we can leverage
	* http://thwack.solarwinds.com/docs/DOC-163254 example
* Add pre/post callout's in BPL's with custom settings
* Grabbing original message from session id - [SessionIDInEnsemble.md](SessionIDInEnsemble.md) 
* Dynamic IPs? do we still need this?
* 600 Cims? is this initial load - got a note on this, don't recall details??
* "Secret" CSP Security Settings
* XREF Code Tables - send all the codes in the CIM - HMX TODO... get's rid of ODBC load
* ZSTART - already added UNC auth, what else are we adding?
* Dev - run things locally? TFS/Studio SCM
* $system.Event and Pub/Sub api's - good way to decouple and build in extensibility points
* OPS - scalability - mapping small/medium/big SQLServer customers to similar Exchange setups, is that right?
* OPS - should monitor IIS on Exchange box to check Vision-to-HS connection
* Alerting 
	* "Level 0" - utilize out-of-box "Ens.Alert" functionality, this gives 'peace of mind' type alerting
	* routing rule, can use Ens.Util.LookupTable to not hard code actual email addresses
	* "Level 1" - need 'dashboard' requirements and vision, that will drive what metrics we need to capture
	* custom alert 'sink' component
* CSP development - guys want training - better approach is to decide on what we want to build (draw a picture) and then we can direct the correct training
* Segment-level tranforms - PID,PV1,...
* Named Solutions - how do we deal with this? 
	* Just like HMXBASECODE - do they have HMXNAMESOLUTIONS, or maybe HMXPHARM do we package map?
	* How does this fit in dev builds?
* XSD's DEV builds should load them into the DB, then the automation will write them back out on the file system to the _XSD directory where then need to be for the runtime.
* Unit Testing - a way to link why things failed into the csp portal
* How to call a classmethod from .NET? Actually want to kick off %UnitTests from Visual Studio test runner
* Add Unit Test's for BPL's
* Way to test a routing rule
