<!--
document.write('<a href="http://www.xiti.com/xiti.asp?s=192857" title="Mesurez votre audience">');
Xt_param = 's=192857&p=';
Xt_r = document.referrer;
Xt_h = new Date();
Xt_i = '<img width="39" height="25" border="0" ';
Xt_i += 'src="http://logv26.xiti.com/hit.xiti?'+Xt_param;
Xt_i += '&hl='+Xt_h.getHours()+'x'+Xt_h.getMinutes()+'x'+Xt_h.getSeconds();
if(parseFloat(navigator.appVersion)>=4)
{Xt_s=screen;Xt_i+='&r='+Xt_s.width+'x'+Xt_s.height+'x'+Xt_s.pixelDepth+'x'+Xt_s.colorDepth;}
document.write(Xt_i+'&ref='+Xt_r.replace(/[<>"]/g, '').replace(/&/g, '$')+'" title="Analyse d\'audience">');
//-->