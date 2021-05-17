<?xml version="1.0" encoding="UTF-8"?>
<!-- la ligne suivante doit être avant la balise xsl:stylesheet -->
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<html>
			<body>
				<h2> Information about the client with their expired policy and policy duration</h2>
				<blockquote>
					<xsl:apply-templates select="//Client">
					</xsl:apply-templates>
				</blockquote>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="Client">
		<p><strong>
                <!-- Retriving the Client with their policy_end and the policy duration -->
				<Insurance_ID>Insurance_ID:<xsl:value-of select="Insurance_ID"/></Insurance_ID> ,
				<Policy_End>Policy_End:<xsl:value-of select="Policy_End"/></Policy_End> ,
				<Policy_Duration>Policy_Duration:<xsl:value-of select="Policy_Duration"/></Policy_Duration> ,
				<Premium>Premium:<xsl:value-of select="Premium"/></Premium> ,
				<Category>Category:<xsl:value-of select="Category"/></Category> ,
			</strong></p>
		<xsl:apply-templates select="Employee_Information"/>
	</xsl:template>
	<xsl:template match="//Employee_Information">
		<p><strong>
				<FirstName>FirstName:<xsl:value-of select="FirstName"/></FirstName> ,
				<LastName>LastName:<xsl:value-of select="LastName"/></LastName>
			</strong></p><br/>
	</xsl:template>
</xsl:stylesheet>
