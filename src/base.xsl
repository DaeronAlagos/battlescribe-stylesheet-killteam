<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" 
                xmlns:exslt="http://exslt.org/common" 
                extension-element-prefixes="exslt">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
		<xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>
		<xsl:variable name="levels" select="'Level 1|Level 2|Level 3|Level 4'"/>

	<xsl:template match="bs:roster/bs:forces/bs:force">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="en">
		<head>
			<style>
					<!-- inject:../build/style.css -->
					<!-- contents of html partials will be injected here -->
          <!-- endinject -->
			</style>
			<title>Kill Team Roster</title>
		</head>
		<body>
			<xsl:variable name="list-configuration" select=".//bs:selection[@name='List Configuration']//bs:selection"/>
			<xsl:if test="contains($list-configuration/@name, 'Campaign') or contains($list-configuration/@name, 'Roster')">
				<section id="title">
					<div>
						<h1>command roster</h1>
					</div>
				</section>
			</xsl:if>

			<xsl:if test="contains($list-configuration/@name, 'Campaign')">
				<div id="campaign">
					<xsl:call-template name="campaign">
						<xsl:with-param name="resources" select=".//bs:selection[@name='Resources']"/>
					</xsl:call-template>
				</div>
			</xsl:if>

			<xsl:if test="contains($list-configuration/@name, 'Campaign') or contains($list-configuration/@name, 'Roster')">
				<div id="roster">
					<table class="roster">
						<tr>
							<th>name</th>
							<th>model type</th>
							<th>wargear</th>
							<th>exp</th>
							<th>specialism/abilities</th>
							<th>demeanour</th>
							<th>pts</th>
						</tr>
						<xsl:apply-templates select="bs:selections" mode="roster"/>
					</table>

				</div>
			</xsl:if>

			<xsl:apply-templates select="bs:selections" mode="card"/>

		</body>
		</html>
	</xsl:template>

	<!-- inject:campaign.xsl -->
	<!-- contents of html partials will be injected here -->
	<!-- endinject -->
	
	<!-- inject:roster.xsl -->
	<!-- contents of html partials will be injected here -->
	<!-- endinject -->

  <!-- inject:card.xsl -->
  <!-- contents of html partials will be injected here -->
	<!-- endinject -->
	
	<xsl:template match="bs:cost[@name='pts']" mode="points">
		<points>
			<xsl:value-of select="@value"/>
		</points>
	</xsl:template>

</xsl:stylesheet>