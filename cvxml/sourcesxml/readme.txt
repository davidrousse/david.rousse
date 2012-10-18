*********************************************
************       Contenu       ************
************    David ROUSSE     ************
*********************************************

readme.txt : ce fichier

\xml : CV en XML à valider via xsd/cv.xsd

\img : images utilisées dans un CV

\xsd : schema XML pour la validation d'un CV

\xsl : feuilles de style pour la présentation d'un CV 
       en (X)HTML (cv_html.xsl) et en FO (cv_fo.xsl)

Utilitaires XML en ligne de commande :

- Parseur XML Xerces
java dom.Counter -v [-s] cv.xml 
java sax.Counter -v [-s] cv.xml

- Processeur XSLT Xalan 
java org.apache.xalan.xslt.Process -IN cv.xml -XSL xsl/cv.xsl -OUT cv.html

- Formatteur FOP 
java org.apache.fop.apps.Fop -fo cv.fo -pdf cv.pdf

***********************************************
* Date de création : 15/02/2003		      *
* Dernière mise à jour : 15/02/2003           *
***********************************************
*         Ingénieur d'études CNRS             *
***********************************************
