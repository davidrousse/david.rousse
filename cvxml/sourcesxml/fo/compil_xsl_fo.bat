@echo off
echo Compilation XML vers FO ...
java org.apache.xalan.xslt.Process -IN %1.xml -XSL %2.xsl -OUT %3.fo