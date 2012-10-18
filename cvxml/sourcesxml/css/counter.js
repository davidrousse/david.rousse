function sp(_serial,_page) {
document.write('<a href="http://www.wanadoo.fr/pages_per'+
'so/estat/bin/pwpestat_stat.cgi"><img src'+
'="http://perso.estat.com/cgi-bin/perso/'
+_serial+'?'
+'&n='+Math.round (Math.random () * 1000000000000000)
+'&page='+escape(_page.length?_page:document.title)
+'&referer='+escape(document.referrer)+'" BORDER=0></A>')
}
sp("380080111592", "NomDeVotrePage")