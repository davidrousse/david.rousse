<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dr="http://perso.wanadoo.fr/david.rousse/" exclude-result-prefixes="dr">
	<xsl:output method="html" indent="yes" media-type="text/html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" encoding="ISO-8859-1" />
	<!--
 Description : feuille de style pour la validation d'un CV (XML vers HTML)
 Auteur : David ROUSSE, d.rousse@wanadoo.fr
 Date derniere modification : 01/02/2003
-->
	<!-- Definition regle pour element racine -->
	<xsl:template match="dr:cv">
		<html>
			<head>
				<meta name="descriprion" content="{@description}"/>
				<meta http-equiv="Content-Language" content="fr"/>
				<meta name="keywords" content="{@mots_cles}" />				
				<!-- Titre de la page HTML -->
				<title>
					<xsl:value-of select="@titre"/>
				</title>
			</head>
			<body>
				<!-- Traitement des enfants du noeud racine        -->
				<!-- On aurait pu ecrire aussi :                   -->
				<!-- <xsl:apply-templates select="*[not(self)]" /> -->
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<!-- Definition regles pour elements (n-1) -->
	<xsl:template match="dr:informations_cv">
		<table summary="entete" border="0" width="100%" cellpadding="0">
			<tr>
				<xsl:apply-templates select="dr:information"/>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="dr:etatcivil">
		<hr style="color: #639CCE" class="ligne_dr"/>
		<table summary="etatcivil" border="0" width="100%">
			<tr>
				<!-- Traitement du titre -->
				<xsl:apply-templates select="dr:titre"/>
			</tr>
			<tr>
				<td width="58%">
					<!-- Traitement des renseignements generaux de l'etat civil -->
					<b>
						<font face="Arial" color="#000080" size="2">
							<xsl:value-of select="dr:prenom"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="dr:nom"/>
						</font>
					</b>
					<br/>
					<font face="Arial" size="2">
						<xsl:value-of select="dr:adresse/dr:numero"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="dr:adresse/dr:rue"/>
					</font>
					<br/>
					<font face="Arial" size="2">
						<xsl:value-of select="dr:adresse/dr:code_postal"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dr:adresse/dr:ville"/>
					</font>
					<br/>
					<font face="Arial" size="2">
						<xsl:value-of select="dr:telephone"/>
					</font>
					<br/>
					<font face="Arial" size="2">
						<a href="{dr:email/@href}">
							<xsl:value-of select="dr:email"/>
						</a>
					</font>
					<br/>
					<font face="Arial" size="2">
						<xsl:value-of select="dr:age"/>
					</font>
					<br/>
					<font face="Arial" size="2">
						<xsl:value-of select="dr:etat_marital"/>
					</font>
				</td>
				<td width="42%">
					<!-- Traitement de la photo d'identite -->
					<xsl:apply-templates select="dr:photo_identite"/>
				</td>
			</tr>
			<tr>
				<!-- Traitement de la ligne d'information pour le CV anglais -->
				<xsl:apply-templates select="dr:information"/>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="dr:formations">
		<table summary="formation" border="0" width="100%">
			<tr>
				<!-- Traitement du titre -->
				<xsl:apply-templates select="dr:titre"/>
			</tr>
			<!-- Traitement de chaque formation -->
			<xsl:apply-templates select="dr:formation"/>
		</table>
	</xsl:template>
	<xsl:template match="dr:connaissances">
		<table summary="connaissances" border="0" width="100%">
			<tr>
				<!-- Traitement du titre -->
				<xsl:apply-templates select="dr:titre"/>
			</tr>
			<!-- Traitement de chaque connaissance par ordre alphabétique de nom de domaine -->
			<xsl:apply-templates select="dr:connaissance">
				<xsl:sort select="dr:domaine">
   </xsl:sort>
			</xsl:apply-templates>
		</table>
	</xsl:template>
	<xsl:template match="dr:experiences_professionnelles">
		<table summary="experiences_professionnelles" border="0" width="100%">
			<tr>
				<!-- Traitement du titre -->
				<xsl:apply-templates select="dr:titre"/>
			</tr>
			<!-- Traitement de chaque experience professionnelle -->
			<xsl:apply-templates select="dr:experience_professionnelle"/>
			<tr>
				<!-- Traitement de la ligne d'information pour le téléchargement des rapports -->
				<xsl:apply-templates select="dr:information"/>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="dr:divers">
		<table summary="divers" border="0" width="100%">
			<tr>
				<!-- Traitement du titre -->
				<xsl:apply-templates select="dr:titre"/>
			</tr>
			<!-- Traitement des autres informations -->
			<xsl:apply-templates select="dr:langues"/>
			<xsl:apply-templates select="dr:loisirs"/>
			<xsl:apply-templates select="dr:particularites"/>
		</table>
	</xsl:template>
	<!-- Definition regles pour elements (n-2) -->
	<xsl:template match="dr:information">
		<xsl:choose>
			<xsl:when test="@type='script'">
				<td width="50%" valign="middle">
					<p align="left">
						<script language="javascript" src="{@href}" type="text/javascript">
						</script>
					</p>
				</td>
			</xsl:when>
			<xsl:when test="preceding-sibling::node()/attribute::type='script'">
				<td width="50%" valign="middle">
					<p align="right">
						<a href="{@href}">
							<font size="1" face="Arial">
								<i>
									<xsl:value-of select="."/>
								</i>
							</font>
						</a>
					</p>
				</td>
			</xsl:when>
			<xsl:when test="position()=1 and count(../dr:information)=2">
				<td width="50%" valign="middle">
					<p align="left">
						<a href="{@href}">
							<font size="1" face="Arial">
								<img alt="{@title}" border="0" src="{@image}" width="20" height="16"/>
								<i>
									<xsl:value-of select="."/>
								</i>
							</font>
						</a>
					</p>
				</td>
			</xsl:when>
			<xsl:when test="position()=2">
				<td width="50%" valign="middle">
					<p align="right">
						<a href="{@href}">
							<font size="1" face="Arial">
								<img alt="{@title}" border="0" src="{@image}" width="20" height="16"/>
								<i>
									<xsl:value-of select="."/>
								</i>
							</font>
						</a>
					</p>
				</td>
			</xsl:when>
			<xsl:when test="position()=1 and count(../dr:information)=1 and name(..)='dr:informations_cv'">
				<td width="50%" valign="middle">
					<p align="right">
						<a href="{@href}">
							<font size="1" face="Arial">
								<i>
									<xsl:value-of select="."/>
								</i>
							</font>
						</a>
					</p>
				</td>
			</xsl:when>
			<xsl:when test="position()=1 and count(../dr:information)=1 and name(..)='dr:experiences_professionnelles'">
				<td colspan="2" width="100%" valign="middle">
					<p align="center">
						<a href="{@href}">
							<font size="1" face="Arial">
								<img alt="{@title}" border="0" src="{@image}" width="20" height="16"/>
								<i>
									<xsl:value-of select="."/>
								</i>
							</font>
						</a>
					</p>
				</td>
			</xsl:when>
			<xsl:otherwise>
				<td width="50%" valign="middle">
					<p align="right">
						<a href="{@href}">
							<font size="1" face="Arial">
								<img alt="{@title}" border="0" src="{@image}" width="20" height="16"/>
								<i>
									<xsl:value-of select="."/>
								</i>
							</font>
						</a>
					</p>
				</td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="dr:titre">
		<xsl:choose>
			<xsl:when test="name(..)='dr:etatcivil'">
				<!-- Traitement specifique pour le titre de l'etat civil -->
				<td width="210%" bgcolor="#639CCE" colspan="2">
					<p align="center">
						<b>
							<font color="#000080" face="Arial">
								<xsl:value-of select="substring-before(.,',')"/>
								<br/>
								<xsl:value-of select="substring-before(substring-after(.,','),'(')"/>
								<br/>
								<xsl:text>(</xsl:text>
								<xsl:value-of select="substring-after(substring-after(.,','),'(')"/>
							</font>
						</b>
					</p>
				</td>
			</xsl:when>
			<xsl:otherwise>
				<!-- Traitement basique pour un titre -->
				<td width="210%" bgcolor="#639CCE" colspan="2">
					<p align="center">
						<b>
							<font color="#000080" face="Arial">
								<xsl:value-of select="text()"/>
							</font>
						</b>
					</p>
				</td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="dr:formation">
		<tr>
			<!-- Traitement de la periode (date_debut et date_fin) -->
			<td width="25%" valign="top" align="left">
				<p>
					<font face="Arial" size="2">
						<xsl:if test="string-length(dr:date_fin)=0">
							<xsl:value-of select="dr:date_debut"/>
							<xsl:text> - ... </xsl:text>
						</xsl:if>
						<xsl:if test="string-length(dr:date_fin)!=0">
							<xsl:value-of select="dr:date_debut"/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="dr:date_fin"/>
						</xsl:if>
					</font>
				</p>
			</td>
			<!-- Traitement des autres informations -->
			<td width="94%">
				<p>
					<font face="Arial" size="2">
						<xsl:value-of select="dr:description"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="dr:organisme"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="dr:ville"/>
					</font>
				</p>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="dr:experience_professionnelle">
		<tr>
			<!-- Traitement de la periode (date_debut et date_fin) -->
			<td width="25%" valign="top" align="left">
				<p>
					<font face="Arial" size="2">
						<xsl:if test="string-length('date_debut')=0">
							<xsl:value-of select="dr:date_debut"/>
						</xsl:if>
						<xsl:if test="not(string-length('date_debut')=0)">
							<xsl:value-of select="dr:date_debut"/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="dr:date_fin"/>
						</xsl:if>
					</font>
				</p>
			</td>
			<!-- Traitement des autres informations -->
			<td width="75%">
				<p>
					<font face="Arial" size="2">
						<xsl:value-of select="dr:description"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="dr:organisme"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="dr:ville"/>
					</font>
				</p>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="dr:connaissance">
		<tr>
			<!-- Traitement du domaine -->
			<td width="25%" valign="top" align="left">
				<p>
					<u>
						<font face="Arial" size="2">
							<xsl:value-of select="dr:domaine"/>
						</font>
					</u>
				</p>
			</td>
			<!-- Traitement des matieres -->
			<td width="106%" height="21">
				<p>
					<xsl:apply-templates select="dr:matiere"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="dr:langues">
		<tr>
			<td width="25%" valign="top" align="left">
				<p>
					<u>
						<font face="Arial" size="2">
     Langues
    </font>
					</u>
				</p>
			</td>
			<td width="123%">
				<p>
					<xsl:apply-templates select="dr:langue"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="dr:loisirs">
		<tr>
			<td width="25%" align="left">
				<p>
					<u>
						<font face="Arial" size="2">
     Loisirs
    </font>
					</u>
				</p>
			</td>
			<td width="72%">
				<p>
					<xsl:apply-templates select="dr:loisir"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="dr:particularites">
		<tr>
			<td width="25%" align="left">
				<p>
					<u>
						<font face="Arial" size="2">
     Particularites
    </font>
					</u>
				</p>
			</td>
			<td width="72%">
				<p>
					<xsl:apply-templates select="dr:particularite"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	<!-- Definition regles pour elements (n-3) -->
	<xsl:template match="dr:matiere">
		<font face="Arial" size="2">
			<!-- Traitement d'un element quelconque de la liste (sauf le dernier) -->
			<xsl:if test="position()!=count(../dr:matiere)">
				<xsl:value-of select="text()"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<!-- Traitement du dernier element de la liste -->
			<xsl:if test="position()=count(../dr:matiere)">
				<xsl:value-of select="text()"/>
			</xsl:if>
		</font>
	</xsl:template>
	<xsl:template match="dr:langue">
		<font face="Arial" size="2">
			<!-- Traitement d'un element quelconque de la liste (sauf le dernier) -->
			<xsl:if test="position()!=count(../dr:langue)">
				<xsl:value-of select="dr:nom_langue"/>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="dr:niveau_langue"/>
				<xsl:text>), </xsl:text>
			</xsl:if>
			<!-- Traitement du dernier element de la liste -->
			<xsl:if test="position()=count(../dr:langue)">
				<xsl:value-of select="dr:nom_langue"/>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="dr:niveau_langue"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</font>
	</xsl:template>
	<xsl:template match="dr:loisir">
		<font face="Arial" size="2">
			<!-- Traitement d'un element quelconque de la liste (sauf le dernier) -->
			<xsl:if test="position()!=count(../dr:loisir)">
				<xsl:value-of select="text()"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<!-- Traitement du dernier element de la liste -->
			<xsl:if test="position()=last()">
				<xsl:value-of select="text()"/>
			</xsl:if>
		</font>
	</xsl:template>
	<xsl:template match="dr:particularite">
		<font face="Arial" size="2">
			<!-- Traitement d'un element quelconque de la liste (sauf le dernier) -->
			<xsl:if test="position()!=count(../dr:particularite)">
				<xsl:value-of select="text()"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<!-- Traitement du dernier element de la liste -->
			<xsl:if test="position()=last()">
				<xsl:value-of select="text()"/>
			</xsl:if>
		</font>
	</xsl:template>
	<xsl:template match="dr:photo_identite">
		<p align="center">
			<a href="{//dr:email/@href}">
				<font face="Arial">
					<img alt="moi" border="0" src="{@image}" width="129" height="165"/>
				</font>
			</a>
		</p>
	</xsl:template>
	<xsl:template match="dr:copyright">
		<p align="center">
			<font size="1" face="Arial">
				<i>
					<xsl:value-of select="."/>
				</i>
			</font>
		</p>
	</xsl:template>
</xsl:stylesheet>
