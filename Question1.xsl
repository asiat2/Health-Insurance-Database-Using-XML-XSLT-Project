<?xml version="1.0" encoding="UTF-8"?>
<!-- la ligne suivante doit être avant la balise xsl:stylesheet -->
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<html>
			<body>
				<!-- Counting the number of Category GroupA in the database -->
				<h1>There are <xsl:value-of select="count(/EMR/Client[Category= 'GroupA']/Employee_Information)"/>  Client with Insurance Category GroupA in the Database.</h1>
				<blockquote>
					<xsl:apply-templates select="//Client">
					</xsl:apply-templates>
				</blockquote>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Client"/> 
	<xsl:template match="Client[Category = 'GroupA']">
		<xsl:apply-templates select="Employee_Information"/>
	</xsl:template>
	<xsl:template match="//Employee_Information">
		<p><em>
				<FirstName><xsl:value-of select="FirstName"/></FirstName> 
				<xsl:text> ,</xsl:text>
				<LastName><xsl:value-of select="LastName"/></LastName>
                <xsl:text> : </xsl:text>				
				<City><xsl:value-of select="City"/></City>
		</em></p>
	</xsl:template>
</xsl:stylesheet>
