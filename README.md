Important links for this POC

https://www.igorkromin.net/index.php/2018/01/09/how-to-resolve-the-domain-is-already-mapped-to-a-project-error-in-google-app-engine/

https://stackoverflow.com/questions/46345759/error-domain-is-already-mapped-to-a-project-in-google-cloud-platform/49313083#49313083

https://stackoverflow.com/questions/49480940/app-engine-custom-domain-with-service

https://cloud.google.com/appengine/docs/standard/python/mapping-custom-domains

https://www.murrayc.com/permalink/2017/10/15/google-app-engine-using-subdomains/

https://groups.google.com/forum/#!msg/google-appengine/xycWwRX2OiU/8ivTxBrDAgAJ

execute the command 
gcloud app domain-mappings create domain_name

Add the ipv4 and ipv6 values in registered hosts section in google domains and add name with ghs.googlehosted.com to record set of cname type
