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
		<html>
		<head>
			<style>
					<!-- inject:../build/style.css -->
					@import url("https://fonts.googleapis.com/css?family=Oswald:600|EB+Garamond:400,400i,700");
body {
  font-family: 'EB Garamond', serif; }

h1 {
  font-weight: bold;
  font-family: 'Oswald', sans-serif;
  text-align: center;
  font-size: 42pt;
  margin: 0;
  text-transform: uppercase; }

#campaign {
  margin-bottom: 20px; }

.campaign {
  display: flex;
  flex-flow: row nowrap; }
  .campaign > div {
    flex: 1 0;
    margin: 1px;
    padding: 3px;
    border: 1px solid #000; }

.campaign-header {
  font-weight: bold;
  font-family: 'Oswald', sans-serif;
  background-color: #E1501E;
  border-top: 1px solid #000000;
  border-bottom: 1px solid #000000;
  text-transform: uppercase; }

.roster-header {
  display: flex;
  flex-flow: row nowrap;
  font-weight: bold;
  font-family: 'Oswald', sans-serif;
  background-color: #E1501E;
  border-top: 1px solid #000000;
  border-bottom: 1px solid #000000;
  text-transform: uppercase; }
  .roster-header div {
    flex: 1 0;
    margin: 1px;
    padding: 3px;
    text-align: center; }

.roster-data {
  display: flex;
  flex-flow: row nowrap; }
  .roster-data > div {
    background-color: #dfdfdf; }
  .roster-data > div {
    flex: 1 0;
    margin: 1px;
    padding: 3px;
    text-align: center;
    font-size: 9pt; }

.card {
  display: flex;
  flex-flow: column nowrap;
  width: 11.5cm;
  min-height: 7.5cm;
  border-radius: 8px;
  border: 1px solid #BBBBBB;
  font-size: 10pt;
  padding: 0.2cm; }

.title {
  display: flex;
  flex-flow: row nowrap;
  margin-bottom: 3px; }
  .title > div {
    font-weight: bold;
    font-family: 'Oswald', sans-serif;
    flex: 1 0;
    text-align: center; }
    .title > div:first-child {
      text-align: left;
      flex: 2 0; }
    .title > div:last-child {
      text-align: right;
      flex: 2 0; }

.row {
  display: flex;
  flex-flow: row nowrap; }

.col {
  display: flex;
  flex-flow: column nowrap; }

.model-header {
  display: flex;
  flex-flow: row nowrap;
  font-weight: bold;
  font-family: 'Oswald', sans-serif;
  background-color: #E1501E;
  border-top: 1px solid #000000;
  border-bottom: 1px solid #000000;
  text-transform: uppercase; }
  .model-header div {
    text-align: center;
    margin: 1px;
    padding: 1px;
    flex: 1 0 0.55708cm; }
    .model-header div:first-child {
      flex: 0 0 2cm;
      text-align: left;
      padding-left: 3px;
      margin: 1px 1px 1px 0; }
    .model-header div:last-child {
      margin: 1px 0 1px 1px; }

.model-data {
  display: flex;
  flex-flow: row nowrap;
  font-weight: bold; }
  .model-data > div {
    background-color: #dfdfdf; }
  .model-data div {
    display: flex;
    flex-flow: column nowrap;
    text-align: center;
    margin: 1px;
    padding: 1px;
    flex: 1 0 0.55708cm;
    justify-content: space-evenly; }
    .model-data div:first-child {
      flex: 0 0 2cm;
      text-align: left;
      padding-left: 3px;
      margin: 1px 1px 1px 0; }
    .model-data div:last-child {
      margin: 1px 0 1px 1px; }

.wargear-header {
  display: flex;
  flex-flow: row nowrap;
  font-weight: bold;
  font-family: 'Oswald', sans-serif;
  background-color: #E1501E;
  border-top: 1px solid #000000;
  border-bottom: 1px solid #000000;
  text-transform: uppercase; }
  .wargear-header div {
    text-align: center;
    margin: 1px;
    padding: 2px;
    flex: 0 0 1.16708cm; }
    .wargear-header div:first-child {
      flex: 0 0 2cm;
      text-align: left;
      padding-left: 3px;
      margin: 1px 1px 1px 0; }
    .wargear-header div:last-child {
      margin: 1px 0 1px 1px; }
    .wargear-header div:last-child {
      flex: 1 0; }

.wargear-data {
  display: flex;
  flex-flow: row nowrap; }
  .wargear-data > div {
    background-color: #dfdfdf; }
  .wargear-data > div {
    text-align: center;
    margin: 1px;
    padding: 2px;
    flex: 0 0 1.16708cm; }
    .wargear-data > div:first-child {
      flex: 0 0 2cm;
      text-align: left;
      padding-left: 3px;
      margin: 1px 1px 1px 0; }
    .wargear-data > div:last-child {
      margin: 1px 0 1px 1px; }
    .wargear-data > div:last-child {
      flex: 1 0;
      font-size: 9pt; }

.ability-header {
  display: flex;
  flex-flow: row nowrap;
  font-weight: bold;
  font-family: 'Oswald', sans-serif;
  padding-left: 3px; }

.ability-data {
  display: flex;
  flex-flow: row nowrap; }
  .ability-data > div {
    background-color: #dfdfdf; }
  .ability-data > div {
    text-align: center;
    margin: 1px;
    padding: 2px;
    flex: 0 0; }
    .ability-data > div:first-child {
      flex: 0 0 2cm;
      text-align: left;
      padding-left: 3px;
      margin: 1px 1px 1px 0; }
    .ability-data > div:last-child {
      margin: 1px 0 1px 1px; }
    .ability-data > div:last-child {
      flex: 1 0;
      font-size: 9pt; }

.exp {
  display: flex;
  flex-flow: row nowrap;
  flex-grow: 1;
  font-size: 8pt;
  margin-top: 3px; }
  .exp > div {
    align-self: flex-end;
    margin: 0 2px; }

@media screen {
  #cards {
    display: flex;
    flex-wrap: wrap; }
    #cards > div {
      margin: 5px; } }

@media print {
  #campaign, #roster {
    page-break-after: always; }
  .card {
    page-break-inside: avoid; } }

					<!-- endinject -->
			</style>
		</head>
		<body>
			<xsl:variable name="list-configuration" select=".//bs:selection[@name='List Configuration']//bs:selection"/>

			<xsl:if test="contains($list-configuration/@name, 'Campaign')">
				<section id="campaign">
					<xsl:call-template name="campaign">
						<xsl:with-param name="resources" select=".//bs:selection[@name='Resources']"/>
					</xsl:call-template>
				</section>
			</xsl:if>

			<xsl:if test="contains($list-configuration/@name, 'Campaign') or contains(@name, 'Roster')">
				<section id="roster">
					<div>
						<h1>command roster</h1>
					</div>
					<div class="col">
						<div class="roster-header">
							<div>name</div>
							<div>model type</div>
							<div>wargear</div>
							<div>exp</div>
							<div style="flex: 2 0;">specialism/abilities</div>
							<div>demeanour</div>
							<div>pts</div>
						</div>
						<xsl:apply-templates select="bs:selections" mode="roster"/>
					</div>
				</section>
			</xsl:if>

			<section id="cards">
				<xsl:apply-templates select="bs:selections" mode="card"/>
			</section>
		</body>
		</html>
	</xsl:template>

	<!-- inject:campaign.xsl -->
	<xsl:template name="campaign">
  <div class="campaign">
    <div class="campaign-header">Player Name</div>
    <div></div>
    <div class="campaign-header">Resources</div>
    <div class="campaign-header">Current Kill Team Force</div>
    <div>
      <xsl:value-of select="round(../../bs:costs/bs:cost/@value)"/>
      Points
    </div>
  </div>
  <div class="campaign">
    <div class="campaign-header">Faction</div>
    <div>
      <xsl:value-of select="@catalogueName"/>
    </div>
    <div class="row">
      <div>
        <xsl:value-of select=".//bs:selection[@name='Intelligence']/@name"/>
      </div>
      <div>
        <xsl:value-of select=".//bs:selection[@name='Intelligence']/@number"/>
      </div>
    </div>
    <div class="campaign-header">Current Kill Team's Name</div>
    <div></div>
  </div>
  <div class="campaign">
    <div class="campaign-header">Mission</div>
    <div></div>
    <div class="row">
      <div>
        <xsl:value-of select=".//bs:selection[@name='Materiel']/@name"/>
      </div>
      <div>
        <xsl:value-of select=".//bs:selection[@name='Materiel']/@number"/>
      </div>
    </div>
    <div></div>
    <div></div>
  </div>
  <div class="campaign">
    <div class="campaign-header">Background</div>
    <div></div>
    <div class="row">
      <div>
        <xsl:value-of select=".//bs:selection[@name='Morale']/@name"/>
      </div>
      <div>
        <xsl:value-of select=".//bs:selection[@name='Morale']/@number"/>
      </div>
    </div>
    <div></div>
    <div></div>
  </div>
  <div class="campaign">
    <div class="campaign-header">Squad Quirk</div>
    <div></div>
    <div class="row">
      <div>
        <xsl:value-of select=".//bs:selection[@name='Territory']/@name"/>
      </div>
      <div>
        <xsl:value-of select=".//bs:selection[@name='Territory']/@number"/>
      </div>
    </div>
    <div></div>
    <div></div>
  </div>
</xsl:template>
	<!-- endinject -->
	
	<!-- inject:roster.xsl -->
	<xsl:template match="bs:selection[@type='model']" mode="roster">
  <xsl:variable name="nodePoints">
    <xsl:apply-templates mode="points"/>
  </xsl:variable>
  <xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
  <div class="roster-data">
    <div>
      <xsl:value-of select="@customName"/>
    </div>
    <div>
      <xsl:value-of select=".//bs:profile[@typeName='Model']/@name"/>
    </div>
    <div>
      <xsl:for-each select="bs:profiles/bs:profile[(@typeName='Weapon' or @typeName='Wargear') and not(@name = 'Special Issue Ammunition')]">
        <xsl:sort select="not(@typeName='Wargear')"/>
        <xsl:sort select="@typeName"/>
        <xsl:if test="../../@number > 1">
          <xsl:value-of select="../../@number"/>x
        </xsl:if>
        <xsl:value-of select="@name"/>,
      </xsl:for-each>
      <xsl:for-each select="bs:selections/bs:selection">
        <xsl:for-each select=".//bs:profile[@typeName='Weapon' or @typeName='Wargear' or @typeName='Special Issue Ammunition']">
          <xsl:sort select="not(@typeName='Wargear')"/>
          <xsl:sort select="@typeName"/>
          <xsl:if test="../../@number > 1">
            <xsl:value-of select="../../@number"/>x
          </xsl:if>
          <xsl:value-of select="@name"/>,
        </xsl:for-each>
      </xsl:for-each>
    </div>
    <div></div>
    <div style="flex: 2 0;">
      <xsl:for-each select=".//bs:profile[@typeName='Ability' and contains($specialisms, ../../../../@name)]">
        <xsl:value-of select="../../../../@name"/>,
      </xsl:for-each>
      <xsl:for-each select=".//bs:profile[@typeName='Ability' and not(contains($specialisms, ../../../../@name))]">
        <xsl:value-of select="@name"/>,
      </xsl:for-each>
    </div>
    <div></div>
    <div>
      <xsl:value-of select="sum($PointsSet/points)"/>
    </div>
  </div>

</xsl:template>
	<!-- endinject -->

  <!-- inject:card.xsl -->
  <xsl:template match="bs:selection[@type='model']" mode="card">
  <xsl:variable name="nodePoints">
    <xsl:apply-templates mode="points"/>
  </xsl:variable>
  <xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
  <div class="card">
    <div class="title"> <!-- name/points -->
      <div>
        <xsl:value-of select="@customName"/>
      </div>
      <div>
        <xsl:value-of select=".//bs:selection[@type='upgrade']/.//bs:category[not(contains($levels, @name))]/@name"/>
      </div>
      <div>
        <xsl:value-of select="sum($PointsSet/points)"/>
        Points
      </div>
    </div>
    <div class="col"> <!-- model profile -->
      <xsl:call-template name="model"/>
    </div>
    <div class="col">
      <xsl:call-template name="weapon"/>
    </div>
    <div class="col">
      <xsl:call-template name="ability"/>
    </div>
    <div class="col">
      <xsl:call-template name="psyker"/>
    </div>
    <div class="col">
      <xsl:call-template name="specialism"/>
    </div>
    <xsl:call-template name="exp"/>
  </div>
</xsl:template>

<xsl:template name="model">
  <xsl:for-each select="bs:profiles/bs:profile[@typeName='Model']">
    <div class="model-header">
      <div>Name</div>
      <xsl:for-each select="bs:characteristics/bs:characteristic">
        <div>
          <xsl:value-of select="@name"/>
        </div>
      </xsl:for-each>
    </div>
    <div class="model-data">
      <div>
        <span>
          <xsl:value-of select="@name"/>
        </span>
      </div>
      <xsl:for-each select="bs:characteristics/bs:characteristic">
        <div>
          <span>
            <xsl:value-of select="."/>
          </span>
        </div>
      </xsl:for-each>
    </div>
  </xsl:for-each>
</xsl:template>

<xsl:template name="weapon">
  <!-- header row -->
  <xsl:for-each select=".//bs:profile[@typeName='Weapon']">
    <xsl:if test="position()=1">
      <div class="wargear-header">
        <div>Weapon</div>
        <xsl:for-each select=".//bs:characteristic">
          <div>
            <span>
              <xsl:value-of select="@name"/>
            </span>
          </div>
        </xsl:for-each>
      </div>
    </xsl:if>
  </xsl:for-each>
  <!-- /header row -->

  <!-- weapon row -->
  <xsl:for-each select="bs:profiles/bs:profile[(@typeName='Weapon' or @typeName='Wargear') and not(@name = 'Special Issue Ammunition')]">
    <xsl:sort select="not(@typeName='Wargear')"/>
    <xsl:sort select="@typeName"/>
    <xsl:call-template name="wargear-row"/>
  </xsl:for-each>

  <xsl:for-each select="bs:selections/bs:selection">
    <xsl:for-each select=".//bs:profile[@typeName='Weapon' or @typeName='Wargear' or @typeName='Special Issue Ammunition']">
      <xsl:sort select="not(@typeName='Wargear')"/>
      <xsl:sort select="not(@typeName='Special Issue Ammunition')"/>
      <xsl:sort select="@typeName"/>
      <xsl:call-template name="wargear-row"/>
    </xsl:for-each>
  </xsl:for-each>

  <!-- weapon row -->

</xsl:template>

<xsl:template name="wargear-row">
    <div class="wargear-data">
      <div>
        <xsl:if test="../../@number > 1">
          <xsl:value-of select="../../@number"/>x
        </xsl:if>
        <xsl:value-of select="@name"/>
      </div>
      <xsl:for-each select=".//bs:characteristic">
        <div>
          <xsl:value-of select="."/>
        </div>
      </xsl:for-each>
    </div>
</xsl:template>

<xsl:template name="ability">
  <xsl:variable name="abilities" select=".//bs:profile[@typeName='Ability' and not(contains($specialisms, ../../../../@name))]"/>
  <xsl:for-each select="$abilities">
    <xsl:if test="position()=1">
      <div class="ability-header">
        Abilities:
      </div>
    </xsl:if>
    <div class="ability-data">
      <div>
        <xsl:value-of select="@name"/>
      </div>
      <div>
        <xsl:value-of select="."/>
      </div>
    </div>
  </xsl:for-each>
  <xsl:for-each select=".//bs:rule[not(contains('Markerlight', @name))]">
    <xsl:if test="not($abilities)">
      <xsl:if test="position()=1">
        <div class="ability-header">
          Abilities:
        </div>
      </xsl:if>
    </xsl:if>
    <div class="ability-data">
      <div>
        <xsl:value-of select="@name"/>
      </div>
      <div>
        <xsl:value-of select="bs:description/."/>
      </div>
    </div>
  </xsl:for-each>
</xsl:template>

<xsl:template name="psyker">
  <xsl:for-each select=".//bs:profile[@typeName='Psychic Power']">
    <xsl:if test="position()=1">
      <div class="ability-header">
        <div>Psyker:</div>
        <div>Manifest <xsl:value-of select="../../../.././/bs:characteristic[@name='Manifest']/."/> | Deny <xsl:value-of select="../../../.././/bs:characteristic[@name='Deny']/."/></div>
      </div>
    </xsl:if>
    <xsl:for-each select=".//bs:characteristic">
      <div class="ability-data">
        <div>
          <xsl:value-of select="../../@name"/>
        </div>
        <div>
          <xsl:value-of select="."/>
        </div>
      </div>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xsl:template name="specialism">
  <xsl:for-each select=".//bs:profile[@typeName='Ability' and contains($specialisms, ../../../../@name)]">
    <xsl:if test="position()=1">
      <div class="ability-header">
        Specialism: <xsl:value-of select="../../../../@name"/>
      </div>
    </xsl:if>
    <div class="ability-data">
      <div>
        <xsl:value-of select="@name"/>
      </div>
      <div>
        <xsl:value-of select="."/>
      </div>
    </div>
  </xsl:for-each>
</xsl:template>

<xsl:template name="exp">
  <div class="exp">
    <div>Experience: <span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span></div>
    <div>Flesh Wounds: &#9744; &#9744; &#9744;</div>
    <div>Convalescence: &#9744;</div>
    <div>New Recruit: &#9744;</div>
  </div>
</xsl:template>
  <!-- endinject -->
	
	<xsl:template match="bs:cost[@name='pts']" mode="points">
		<points>
			<xsl:value-of select="@value"/>
		</points>
	</xsl:template>

</xsl:stylesheet>