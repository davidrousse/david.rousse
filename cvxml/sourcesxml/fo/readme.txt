*********************************************
************       Contenu       ************
************    David ROUSSE     ************
*********************************************

readme.txt : ce fichier

compil_fo.bat : compilation d'un .fo en un .pdf via FOP

compil_xsl_fo.bat : compilation d'un .xml en un .fo via Xalan

cv.fo : document FO relatif au CV � pr�senter

cv.pdf : r�sultat de la transformation du XML en PDF via Xalan (XSLT) puis FOP (FO)

Utilitaires XML en ligne de commande :

- Processeur XSLT Xalan 
java org.apache.xalan.xslt.Process -IN cv.xml -XSL xsl/cv.xsl -OUT cv.fo

- Formatteur FOP 
java org.apache.fop.apps.Fop -fo cv.fo -pdf cv.pdf

***********************************************
* Date de cr�ation : 15/02/2003		      *
* Derni�re mise � jour : 15/02/2003           *
***********************************************
*         Ing�nieur d'�tudes CNRS             *
***********************************************
