<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet     version="1.0" 
                        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                        xmlns:fo="http://www.w3.org/1999/XSL/Format"
                     xmlns:dr="http://perso.wanadoo.fr/david.rousse/"
>

<!--
 Description : feuille de style pour la présentation d'un CV (XML vers FOP)
 Auteur : David ROUSSE, d.rousse@wanadoo.fr
 Date derniere modification : 01/02/2003
-->


<!-- Definition regle pour element racine -->
<xsl:template match="dr:cv">
  <fo:root>
          <!-- definition de la mise en page :
             - dans le(s) page-masters, on decrit de différentes pagination de page dont a on besoin (introduction, corps, ...)
         - dans le(s) page-sequence-masters, on indique come les page-masters vont s'enchainer dans le document final
        -->
        <fo:layout-master-set>
            <!-- mise en page (si on besoin de plus d'un type de mise en page, on écrit plusieurs simple-page-master) -->
            <fo:simple-page-master     master-name="page_cv"
                                    page-height="29.7cm"
                                    page-width="21cm"
                                    margin-top="1cm"
                                    margin-bottom="1cm"
                                    margin-left="2.5cm"
                                    margin-right="2.5cm">
                <fo:region-body margin-top="1cm" margin-bottom="2cm"/>
                <fo:region-before extent="1.5cm" />
                <fo:region-after extent="1.5cm" />
            </fo:simple-page-master>
        </fo:layout-master-set>

        <!-- traitement effectif du document -->
        <fo:page-sequence master-reference="page_cv">
        
            <!-- en tête -->
            <fo:static-content flow-name="xsl-region-before">
            <fo:block     text-align="center"
                        font-size="9pt"
                        font-family="serif"
                        font-style="italic">

                    <!-- traitement de la zone d'entete -->
                    <xsl:apply-templates
 select="dr:informations_cv[position()=1]" />

                </fo:block>
            </fo:static-content>

            <!-- pied -->
            <fo:static-content flow-name="xsl-region-after">
            <fo:block     text-align="center"
                        font-size="9pt"
                        font-family="serif"
                        font-style="italic">

                    <!-- traitement de la zone de bas de page -->
                    <xsl:apply-templates select="dr:informations_cv[position()=last()]" />

                </fo:block>
            </fo:static-content>
                
            <!-- flot de donnees principal -->
            <fo:flow flow-name="xsl-region-body">

                <!-- traitement du corps du CV (ous les elements sauf les deux deja inclus en entete et en pied-->
                <xsl:apply-templates select="*[not(self::dr:informations_cv[position()=1]) and not(self::dr:informations_cv[position()=last()])]" /> 

            </fo:flow>
        </fo:page-sequence>
    </fo:root>
</xsl:template>
    
<!-- Definition regles pour elements (n-1) -->
<xsl:template match="dr:informations_cv">
  <fo:table width="100%" table-layout="fixed" >
        <fo:table-column />
        <fo:table-column />
        <fo:table-body>
             <fo:table-row>        
                <xsl:apply-templates select="dr:information" />
             </fo:table-row>            
        </fo:table-body>
    </fo:table>
</xsl:template>

<xsl:template match="dr:etatcivil">
<fo:block>
 <fo:leader leader-pattern="rule" rule-thickness="1pt" color="#639CCE"/>
 <fo:table width="100%" table-layout="fixed">
  <fo:table-column />		
  <fo:table-column />		
  <fo:table-header>
   <fo:table-row>	
    <!-- Traitement du titre -->
    <xsl:apply-templates select="dr:titre" />
   </fo:table-row>
  </fo:table-header>
  <fo:table-body>
   <fo:table-row>	
   <fo:table-cell width="60%" display-align="center">
    <!-- Traitement des renseignements generaux de l'etat civil -->
    <fo:block font-weight="bold" font-size="10pt" color="#000080">
     <xsl:value-of select="dr:prenom" /><xsl:text> </xsl:text><xsl:value-of select="dr:nom" />
    </fo:block> 
    <fo:block color="#000080" font-size="10pt" >
     <xsl:value-of select="dr:adresse/dr:numero" /><xsl:text>, </xsl:text><xsl:value-of select="dr:adresse/dr:rue" />
    </fo:block> 
    <fo:block color="#000080" font-size="10pt">
     <xsl:value-of select="dr:adresse/dr:code_postal" /><xsl:text> </xsl:text><xsl:value-of select="dr:adresse/dr:ville" />
    </fo:block> 
    <fo:block color="#000080" font-size="10pt">
     <xsl:value-of select="dr:telephone" />
    </fo:block> 
    <fo:block color="#000080" font-size="10pt">
     <fo:basic-link color="blue" external-destination="{dr:email/@href}">  
      <xsl:value-of select="dr:email" />
     </fo:basic-link>  
    </fo:block> 
    <fo:block color="#000080" font-size="10pt">
     <xsl:value-of select="dr:age" />
    </fo:block> 
    <fo:block color="#000080" font-size="10pt">
     <xsl:value-of select="dr:etat_marital" />
    </fo:block>
   </fo:table-cell>
   <fo:table-cell width="40%">
    <!-- Traitement de la photo d'identite -->
    <xsl:apply-templates select="dr:photo_identite" />
   </fo:table-cell>
  </fo:table-row>	
  <fo:table-row>	
   <!-- Traitement de la ligne d'information pour le CV anglais -->
   <xsl:apply-templates select="dr:information" />
  </fo:table-row>	
  </fo:table-body>
 </fo:table>
</fo:block>
</xsl:template>

<xsl:template match="dr:formations">
<fo:block space-before.optimum="6pt">
 <fo:table width="100%" table-layout="fixed">
  <fo:table-column column-width="3cm" />		
  <fo:table-column />		
  <fo:table-header>
   <fo:table-row>
    <!-- Traitement du titre -->
    <xsl:apply-templates select="dr:titre" />
   </fo:table-row>
  </fo:table-header>
  <fo:table-body>
   <!-- Traitement de chaque formation -->
   <xsl:apply-templates select="dr:formation" />
  </fo:table-body>
 </fo:table>
</fo:block>
</xsl:template>

<xsl:template match="dr:connaissances">
<fo:block space-before.optimum="6pt">
 <fo:table width="100%" table-layout="fixed">
  <fo:table-column column-width="5cm" />		
  <fo:table-column />		
  <fo:table-header>
   <fo:table-row>
    <!-- Traitement du titre -->
    <xsl:apply-templates select="dr:titre" />
   </fo:table-row>
  </fo:table-header>
  <fo:table-body>
   <!-- Traitement de chaque connaissance par ordre alphabétique de nom de domaine -->
   <xsl:apply-templates select="dr:connaissance">
    <xsl:sort select="dr:domaine">
    </xsl:sort>
   </xsl:apply-templates>
  </fo:table-body>
 </fo:table>
</fo:block>
</xsl:template>

<xsl:template match="dr:experiences_professionnelles">
<fo:block space-before.optimum="6pt">
 <fo:table width="100%" table-layout="fixed">
  <fo:table-column column-width="3cm" />		
  <fo:table-column />		
  <fo:table-header>
   <fo:table-row>
    <!-- Traitement du titre -->
    <xsl:apply-templates select="dr:titre" />
   </fo:table-row>
  </fo:table-header>
  <fo:table-body>
   <!-- Traitement de chaque experience professionnelle -->
   <xsl:apply-templates select="dr:experience_professionnelle" />
  <fo:table-row>
   <!-- Traitement de la ligne d'information pour le téléchargement des rapports -->
   <xsl:apply-templates select="dr:information" />
  </fo:table-row>
  </fo:table-body>
 </fo:table>
</fo:block>
</xsl:template>

<xsl:template match="dr:divers">
<fo:block space-before.optimum="6pt">
 <fo:table width="100%" table-layout="fixed">
  <fo:table-column column-width="5cm" />		
  <fo:table-column />		
  <fo:table-header>
   <fo:table-row>
    <!-- Traitement du titre -->
    <xsl:apply-templates select="dr:titre" />
   </fo:table-row>
  </fo:table-header>
  <fo:table-body>
   <!-- Traitement des autres informations -->
   <xsl:apply-templates select="dr:langues" />
   <xsl:apply-templates select="dr:loisirs" />
   <xsl:apply-templates select="dr:particularites" />
  </fo:table-body>
 </fo:table>
</fo:block>
</xsl:template>

<!-- Definition regles pour elements (n-2) -->
<xsl:template match="dr:information">
    <xsl:choose>
        <xsl:when test="position()=1 and count(../dr:information)=2">
                <fo:table-cell text-align="left">
                    <fo:block>
                        <fo:external-graphic src="../{@image}"/>
                    </fo:block>
                    <fo:block font-style="italic" font-family="serif" font-size="9pt">
                             <fo:basic-link color="blue" external-destination="{@href}">                                                   
                  	          <xsl:value-of select="." />
                               </fo:basic-link>
                    </fo:block>
                </fo:table-cell>
          </xsl:when>
  
          <xsl:when test="position()=2">
                <fo:table-cell text-align="right">
                    <fo:block>
                        <fo:external-graphic src="../{@image}"/>
                    </fo:block>
                    <fo:block font-style="italic" font-family="serif" font-size="9pt">
                             <fo:basic-link color="blue" external-destination="{@href}">                                                   
                                   <xsl:value-of select="." />
                               </fo:basic-link>
                    </fo:block>
                </fo:table-cell>
          </xsl:when>
          <xsl:when test="position()=1 and count(../dr:information)=1 and name(..)='dr:informations_cv'">
                <fo:table-cell text-align="right" number-columns-spanned="2">
                    <fo:block font-style="italic" font-family="serif" font-size="9pt">
                             <fo:basic-link color="blue" external-destination="{@href}">                                                   
                                  <xsl:value-of select="." />
                             </fo:basic-link>
                             <fo:basic-link color="blue" external-destination="{@href}">                                                   
		  			    <!-- Affichage du numero de la page en cours -->	
 		    			    <xsl:text> - Page </xsl:text><fo:page-number />
                             </fo:basic-link>
                    </fo:block>
                </fo:table-cell>
          </xsl:when>
          <xsl:when test="position()=1 and count(../dr:information)=1 and name(..)='dr:experiences_professionnelles'">
                	<fo:table-cell text-align="center" number-columns-spanned="2">
                    <fo:block>
                        <fo:external-graphic src="../{@image}"/>
                    </fo:block>
                    <fo:block font-style="italic" font-family="serif" font-size="9pt">
                        <fo:basic-link color="blue" external-destination="{@href}">                                                   
                               <xsl:value-of select="." />
                        </fo:basic-link>
                    </fo:block>
                </fo:table-cell>
          </xsl:when>
          <xsl:otherwise>
                <fo:table-cell text-align="center" number-columns-spanned="2">
                    <fo:block>
                        <fo:external-graphic src="../{@image}"/>
                    </fo:block>
                    <fo:block font-style="italic" font-family="serif" font-size="9pt">
                             <fo:basic-link color="blue" external-destination="{@href}">                                                   
                                   <xsl:value-of select="." />
                             </fo:basic-link>
                    </fo:block>
                </fo:table-cell>
          </xsl:otherwise>
     </xsl:choose>
</xsl:template>

<xsl:template match="dr:titre">
 <xsl:choose>
  <xsl:when test="name(..)='dr:etatcivil'">
   <!-- Traitement specifique pour le titre de l'etat civil -->
   <fo:table-cell background-color="#639CCE" number-columns-spanned="2">
    <fo:block text-align="center" font-weight="bold" font-size="11pt" color="#000080">
       <xsl:value-of select="substring-before(.,',')" />
    </fo:block> 
    <fo:block text-align="center" font-weight="bold" font-size="11pt" color="#000080">
       <xsl:value-of select="substring-before(substring-after(.,','),'(')" />
    </fo:block> 
    <fo:block text-align="center" color="#000080" font-size="11pt">
       <xsl:text>(</xsl:text><xsl:value-of select="substring-after(substring-after(.,','),'(')" />
    </fo:block> 
   </fo:table-cell>
  </xsl:when>
  <xsl:otherwise>
   <!-- Traitement basique pour un titre -->
   <fo:table-cell background-color="#639CCE" number-columns-spanned="2">
    <fo:block text-align="center" font-weight="bold" color="#000080" font-size="11pt">
     <xsl:value-of select="text()" />
    </fo:block> 
   </fo:table-cell>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template match="dr:formation">
 <fo:table-row>
  <!-- Traitement de la periode (date_debut et date_fin) -->
  <fo:table-cell padding="0.3cm" text-align="left">
   <fo:block font-size="10pt">
     <xsl:if test="string-length(dr:date_fin)=0" >
      <xsl:value-of select="dr:date_debut" /><xsl:text> - ... </xsl:text>
     </xsl:if>
     <xsl:if test="string-length(dr:date_fin)!=0" >
      <xsl:value-of select="dr:date_debut" /><xsl:text> - </xsl:text><xsl:value-of select="dr:date_fin" />
     </xsl:if>
   </fo:block>
  </fo:table-cell>
  <!-- Traitement des autres informations -->
  <fo:table-cell padding="0.3cm" text-align="justify">
   <fo:block font-size="10pt">
    <xsl:value-of select="dr:description" /><xsl:text>, </xsl:text><xsl:value-of select="dr:organisme" /><xsl:text>, </xsl:text><xsl:value-of select="dr:ville" />
   </fo:block>
  </fo:table-cell>
 </fo:table-row>
</xsl:template>

<xsl:template match="dr:experience_professionnelle">
 <fo:table-row>
  <!-- Traitement de la periode (date_debut et date_fin) -->
  <fo:table-cell padding="0.3cm" text-align="left">
   <fo:block font-size="10pt">
     <xsl:if test="string-length('date_debut')=0" >
      <xsl:value-of select="dr:date_debut" />
     </xsl:if>
     <xsl:if test="not(string-length('date_debut')=0)" >
      <xsl:value-of select="dr:date_debut" /><xsl:text> - </xsl:text><xsl:value-of select="dr:date_fin" />
     </xsl:if>
   </fo:block>
  </fo:table-cell>
  <!-- Traitement des autres informations -->
  <fo:table-cell padding="0.3cm" text-align="justify">
   <fo:block font-size="10pt">
    <xsl:value-of select="dr:description" /><xsl:text>, </xsl:text><xsl:value-of select="dr:organisme" /><xsl:text>, </xsl:text><xsl:value-of select="dr:ville" />
   </fo:block>
  </fo:table-cell>
 </fo:table-row>
</xsl:template>

<xsl:template match="dr:connaissance">
 <fo:table-row>
  <!-- Traitement du domaine -->
  <fo:table-cell padding="0.3cm" text-align="left">
   <fo:block font-size="10pt" text-decoration="underline">
     <xsl:value-of select="dr:domaine" />
   </fo:block>
  </fo:table-cell>
  <!-- Traitement des matieres -->
  <fo:table-cell padding="0.3cm" text-align="justify">
   <fo:block font-size="10pt">
    <xsl:apply-templates select="dr:matiere" />
   </fo:block>
  </fo:table-cell>
 </fo:table-row>
</xsl:template>

<xsl:template match="dr:langues">
 <fo:table-row>
  <fo:table-cell padding="0.3cm" text-align="left">
   <fo:block font-size="10pt" text-decoration="underline">
     <xsl:text>Langues</xsl:text>
   </fo:block>
  </fo:table-cell>
  <fo:table-cell padding="0.3cm" text-align="justify">
   <fo:block font-size="10pt">
    <xsl:apply-templates select="dr:langue" />
   </fo:block>
  </fo:table-cell>
 </fo:table-row>
</xsl:template>

<xsl:template match="dr:loisirs">
 <fo:table-row>
  <fo:table-cell padding="0.3cm" text-align="left">
   <fo:block font-size="10pt" text-decoration="underline">
     <xsl:text>Loisirs</xsl:text>
   </fo:block>
  </fo:table-cell>
  <fo:table-cell padding="0.3cm" text-align="justify">
   <fo:block font-size="10pt">
    <xsl:apply-templates select="dr:loisir" />
   </fo:block>
  </fo:table-cell>
 </fo:table-row>
</xsl:template>

<xsl:template match="dr:particularites">
 <fo:table-row>
  <fo:table-cell padding="0.3cm" text-align="left">
   <fo:block font-size="10pt" text-decoration="underline">
     <xsl:text>Particularites</xsl:text>
   </fo:block>
  </fo:table-cell>
  <fo:table-cell padding="0.3cm" text-align="justify">
   <fo:block font-size="10pt">
    <xsl:apply-templates select="dr:particularite" />
   </fo:block>
  </fo:table-cell>
 </fo:table-row>
</xsl:template>

<!-- Definition regles pour elements (n-3) -->
<xsl:template match="dr:matiere">
  <!-- Traitement d'un element quelconque de la liste (sauf le dernier) --> 
  <xsl:if test="position()!=count(../dr:matiere)" >
   <xsl:value-of select="text()" /><xsl:text>, </xsl:text>
  </xsl:if>
  <!-- Traitement du dernier element de la liste --> 
  <xsl:if test="position()=count(../dr:matiere)" >
   <xsl:value-of select="text()" />
  </xsl:if>
</xsl:template>

<xsl:template match="dr:langue">
  <!-- Traitement d'un element quelconque de la liste (sauf le dernier) --> 
  <xsl:if test="position()!=count(../dr:langue)" >
   <xsl:value-of select="dr:nom_langue" /><xsl:text> (</xsl:text><xsl:value-of select="dr:niveau_langue" /><xsl:text>), </xsl:text>
  </xsl:if>
  <!-- Traitement du dernier element de la liste --> 
  <xsl:if test="position()=count(../dr:langue)" >
   <xsl:value-of select="dr:nom_langue" /><xsl:text> (</xsl:text><xsl:value-of select="dr:niveau_langue" /><xsl:text>)</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="dr:loisir">
  <!-- Traitement d'un element quelconque de la liste (sauf le dernier) --> 
  <xsl:if test="position()!=count(../dr:loisir)" >
   <xsl:value-of select="text()" /><xsl:text>, </xsl:text>
  </xsl:if>
  <!-- Traitement du dernier element de la liste --> 
  <xsl:if test="position()=last()" >
   <xsl:value-of select="text()" />
  </xsl:if>
</xsl:template>

<xsl:template match="dr:particularite">
  <!-- Traitement d'un element quelconque de la liste (sauf le dernier) --> 
  <xsl:if test="position()!=count(../dr:particularite)" >
   <xsl:value-of select="text()" /><xsl:text>, </xsl:text>
  </xsl:if>
  <!-- Traitement du dernier element de la liste --> 
  <xsl:if test="position()=last()" >
   <xsl:value-of select="text()" />
  </xsl:if>
</xsl:template>

<xsl:template match="dr:photo_identite">
 <fo:block text-align="center">
  <fo:external-graphic src="../{@image}"/>
 </fo:block>
</xsl:template>

<xsl:template match="dr:copyright">
 <fo:block text-align="center" font-size="9pt" font-style="italic" space-before.optimum="6pt">
   <xsl:value-of select="." />
 </fo:block>
</xsl:template>

</xsl:stylesheet>  




