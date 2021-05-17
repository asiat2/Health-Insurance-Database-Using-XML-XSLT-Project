<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output version="1.0" encoding="UTF-8" indent="yes" />

	<xsl:template match="Insurance">
		<xsl:variable name="frnkey" select="Insurance_ID"/>

		<EMR>  
			<Personal_Information>
				<xsl:for-each select="Personal_Information">
					<Selection>        
						<xsl:copy-of select="FirstName"/>
						<xsl:copy-of select="LastName"/>
						<Insurance_ID><xsl:value-of select="$frnkey"/></Insurance_ID>
					</Selection>
				</xsl:for-each>
			</Personal_Information>

			<Medical_History>
				<xsl:for-each select="Personal_Information/Medical_Record">
					<Sheet>      
						<xsl:copy-of select="Surgries"/>
						<xsl:copy-of select="Consultations"/>
						<Insurance_ID><xsl:value-of select="$frnkey"/></Insurance_ID>
					</Sheet>
				</xsl:for-each>
			</Medical_History>

			<Payments>
				<xsl:for-each select="Payments">
					<Payments>      
						<xsl:copy-of select="Transaction_id"/>
						<xsl:copy-of select="Paid_on_Time"/>
						<xsl:copy-of select="Payment_Date"/>
						<Insurance_ID><xsl:value-of select="$frnkey"/></Insurance_ID>
					</Payments>
				</xsl:for-each>
			</ProductProfile>

			<Claims>
				<xsl:for-each select="Claims/Claim/Bills/Bill_name">
					<Bill_name>      
						<xsl:copy-of select="."/>
						<Insurance_ID><xsl:value-of select="$frnkey"/></Insurance_ID>
					</Bill_name>
				</xsl:for-each>
			</Claims>

		</EMR>

	</xsl:template>
</xsl:transform>