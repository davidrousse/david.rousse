*********************************************
************       Contenu       ************
************    David ROUSSE     ************
*********************************************

readme.txt : ce fichier

\xml : CV en XML � valider via xsd/cv.xsd

\img : images utilis�es dans un CV

\xsd : schema XML pour la validation d'un CV

\xsl : feuilles de style pour la pr�sentation d'un CV 
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
* Date de cr�ation : 15/02/2003		      *
* Derni�re mise � jour : 15/02/2003           *
***********************************************
*         Ing�nieur d'�tudes CNRS             *
***********************************************
