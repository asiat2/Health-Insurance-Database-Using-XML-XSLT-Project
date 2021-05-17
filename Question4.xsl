<?xml version="1.0" encoding="UTF-8"?>
<!-- la ligne suivante doit être avant la balise xsl:stylesheet -->
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="EMR">
		<html>
			<body>
				<!-- Extracting the Employee with their total calims in the database -->
				<h1>Retriving the client with their total claims from the insurance</h1>
				<blockquote>
					<xsl:apply-templates select="//Client">
					</xsl:apply-templates>
				</blockquote>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Client">
	       <p>
		    <!-- Calculating the total calims in the database -->
			<strong><Total_bill><xsl:value-of select="sum(Claims/Claim/Bills/Bill_name)"/></Total_bill></strong>
			 <xsl:text> : </xsl:text>
		<xsl:apply-templates select="Employee_Information"/>
		</p>
		 
	</xsl:template>
	<xsl:template match="//Employee_Information">
			<Employee_ID><xsl:value-of select="@p_id"/></Employee_ID>,
			<FirstName><xsl:value-of select="FirstName"/></FirstName>,
			<LastName><xsl:value-of select="LastName"/></LastName> ,
			<Gender><xsl:value-of select="Gender"/></Gender>
	</xsl:template>
</xsl:stylesheet>
