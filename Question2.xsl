<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>The information of the clients with diabets </title>
			</head>
			<body>
			<!-- Counting the number of Diabets Employee-->
				<h1><strong>There are <xsl:value-of select="count(/EMR/Client/Employee_Information/Medical_History/Diseases[Diabets = 'Yes'])"/> clients with diabets in the database.</strong></h1>
				<blockquote>
					<xsl:apply-templates select="//Employee_Information">
						<xsl:sort select="FirstName" order="ascending"/>
					</xsl:apply-templates>
				</blockquote>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Employee_Information">
		<p><strong>
		<FirstName>FirstName:<xsl:value-of select="FirstName"/></FirstName>,
		<LastName>LastName:<xsl:value-of select="LastName"/></LastName>,
		<Age>Age:<xsl:value-of select="Age"/></Age>,
		</strong></p>
		<xsl:apply-templates select="Medical_History"/>
	</xsl:template>
	<xsl:template match="//Medical_History">
		<p><em>
			<Surgries>Surgries:<xsl:value-of select="Surgries"/></Surgries>,
			<Immunization_status>Immunization_status:<xsl:value-of select="Immunization_status"/></Immunization_status>
		</em></p><br/>
	</xsl:template>
</xsl:stylesheet>