*********************************************
************       Contenu       ************
************    David ROUSSE     ************
*********************************************

readme.txt : ce fichier

version_dtd.zip : CV en XML validé via DTD et présenté en HTML via XSLT

version_xsd.zip : CV en XML validé via Schéma XML (XSD), présenté en HTML via XSLT et en PDF via le couple XSLT/XSL-FO

version_cnrs.zip : CV en XML validé via Schéma XML (XSD), présenté en HTML via XSLT et en PDF via le couple XSLT/XSL-FO
               avec un contenu non personnel destiné à être utilisé lors de formations au CNRS

Configuration utilisée pour les travaux sur XML :

- Windows XP SP1
- JDK 1.4.0_02 (installé dans C:\j2sdk1.4.0_02) 
- Xerces 2.3.0 (installé dans C:\j2sdk1.4.0_02\xerces-2_3_0) 
- Xalan 2.4.1 (installé dans C:\j2sdk1.4.0_02\xalan-j_2_4_1 mais
               copie xalan.jar de dans C:\Program Files\Java\j2re1.4.0_02\lib\endorsed)
- FOP 0.20.4 (installé dans C:\j2sdk1.4.0_02\fop-0.20.4) 
- PATH=%PATH%;C:\j2sdk1.4.0_02\bin
- CLASSPATH=C:\j2sdk1.4.0_02\xerces-2_3_0\xercesSamples.jar;C:\j2sdk1.4.0_02\xerces-2_3_0\xercesImpl.jar;C:\j2sdk1.4.0_02\xerces-2_3_0\xml-apis.jar;C:\j2sdk1.4.0_02\xerces-2_3_0\xmlParserAPIs.jar;C:\j2sdk1.4.0_02\fop-0.20.4\build\fop.jar;C:\j2sdk1.4.0_02\fop-0.20.4\lib\batik.jar;C:\j2sdk1.4.0_02\fop-0.20.4\lib\avalon-framework-cvs-20020315.jar;C:\j2sdk1.4.0_02\fop-0.20.4\lib\logkit.jar;C:\j2sdk1.4.0_02\fop-0.20.4\lib\jimi-1.0.jar;
- JAVA_HOME=C:\j2sdk1.4.0_02

Vérification de la configuration utilisée pour les travaux sur XML :

- lancer pour tester Xalan : java org.apache.xalan.xslt.EnvironmentCheck
- lancer pour tester Xalan (Process) : java org.apache.xalan.xslt.Process -v
- lancer pour tester FOP : java org.apache.fop.apps.Fop

Résumé d'une commande java org.apache.xalan.xslt.EnvironmentCheck sur un environnement correct :
D:\XML\XMLCV\xml>java org.apache.xalan.xslt.EnvironmentCheck
#---- BEGIN writeEnvironmentReport($Revision: 1.14 $): Useful stuff found: ----
version.DOM.draftlevel=2.0fd
java.class.path=C:\j2sdk1.4.0_02\xerces-2_3_0\xercesSamples.jar;C:\j2sdk1.4.0_02
\xerces-2_3_0\xercesImpl.jar;C:\j2sdk1.4.0_02\xerces-2_3_0\xml-apis.jar;C:\j2sdk
1.4.0_02\xerces-2_3_0\xmlParserAPIs.jar
version.JAXP=1.1
java.ext.dirs=C:\Program Files\Java\j2re1.4.0_02\lib\ext
#---- BEGIN Listing XML-related jars in: foundclasses.sun.boot.class.path ----
xalan.jar-apparent.version=xalan.jar WARNING.present-unknown-version
xalan.jar-path=C:\Program Files\Java\j2re1.4.0_02\lib\endorsed\xalan.jar
#----- END Listing XML-related jars in: foundclasses.sun.boot.class.path -----
version.xerces2=Xerces-J 2.3.0
version.xerces1=not-present
version.xalan2_2=Xalan Java 2.4.1
version.xalan1=not-present
version.ant=not-present
java.version=1.4.0_02
version.DOM=2.0
version.crimson=present-unknown-version
sun.boot.class.path=C:\Program Files\Java\j2re1.4.0_02\lib\endorsed\xalan.jar;C:
\Program Files\Java\j2re1.4.0_02\lib\rt.jar;C:\Program Files\Java\j2re1.4.0_02\l
ib\i18n.jar;C:\Program Files\Java\j2re1.4.0_02\lib\sunrsasign.jar;C:\Program Fil
es\Java\j2re1.4.0_02\lib\jsse.jar;C:\Program Files\Java\j2re1.4.0_02\lib\jce.jar
;C:\Program Files\Java\j2re1.4.0_02\lib\charsets.jar;C:\Program Files\Java\j2re1
.4.0_02\classes
#---- BEGIN Listing XML-related jars in: foundclasses.java.class.path ----
xercesImpl.jar-apparent.version=xercesImpl.jar WARNING.present-unknown-version
xercesImpl.jar-path=C:\j2sdk1.4.0_02\xerces-2_3_0\xercesImpl.jar
xml-apis.jar-apparent.version=xml-apis.jar present-unknown-version
xml-apis.jar-path=C:\j2sdk1.4.0_02\xerces-2_3_0\xml-apis.jar
#----- END Listing XML-related jars in: foundclasses.java.class.path -----
version.SAX=2.0
version.xalan2x=Xalan Java 2.4.1
#----- END writeEnvironmentReport: Useful properties found: -----
# YAHOO! Your environment seems to be OK.

***********************************************
* Date de création : 15/02/2003		      *
* Dernière mise à jour : 15/02/2003           *
***********************************************
*         Ingénieur d'études CNRS             *
***********************************************

