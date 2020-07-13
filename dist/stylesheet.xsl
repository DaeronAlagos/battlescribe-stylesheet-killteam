<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" 
                xmlns:exslt="http://exslt.org/common" 
                extension-element-prefixes="exslt">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
    <xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>

	<xsl:template match="bs:roster/bs:forces/bs:force">
		<html>
		<head>
			<style>
					<!-- inject:../build/style.css -->
					@import url("https://fonts.googleapis.com/css?family=Oswald:600|EB+Garamond:400,400i,700");
body {
  font-family: 'EB Garamond', serif; }

.card {
  width: 11.5cm;
  min-height: 7.5cm;
  border-radius: 8px;
  border: 1px solid #BBBBBB;
  font-size: 10pt;
  padding: 0.2cm; }

.row {
  display: flex;
  flex-flow: row nowrap; }

.col {
  display: flex;
  flex-flow: column nowrap; }

.model div {
  text-align: center;
  margin: 1px;
  padding: 1px;
  display: flex;
  flex-flow: column nowrap;
  flex: 1 0 0.55708cm;
  justify-content: space-evenly; }
  .model div:first-child {
    flex: 0 0 2cm;
    text-align: left;
    padding-left: 3px;
    margin: 1px 1px 1px 0; }
  .model div:last-child {
    margin: 1px 0 1px 1px; }

.weapon > div {
  text-align: center;
  margin: 1px;
  padding: 2px;
  flex: 0 0 1.16708cm; }
  .weapon > div:first-child {
    flex: 0 0 2cm;
    text-align: left;
    padding-left: 3px;
    margin: 1px 1px 1px 0; }
  .weapon > div:last-child {
    margin: 1px 0 1px 1px; }
  .weapon > div:last-child {
    flex: 1 0; }

.red {
  background-color: #E1501E;
  text-transform: uppercase;
  border-top: 1px solid #000000;
  border-bottom: 1px solid #000000; }

.grey > div {
  background-color: #dfdfdf; }

.long-string > div:last-child {
  font-size: 9pt; }

.bold {
  font-weight: bold;
  font-family: 'Oswald', sans-serif; }

.pl3 {
  padding-left: 3px; }

#campaign {
  margin-bottom: 20px; }

.campaign > div {
  flex: 1 0;
  margin: 1px;
  padding: 3px;
  border: 1px solid #000; }

.roster > div {
  flex: 1 0;
  margin: 1px;
  padding: 3px;
  text-align: center;
  font-size: 9pt; }

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
      text-align: left; }
    .title > div:last-child {
      text-align: right; }

.exp {
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
  #roster {
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
					<div class="col">
						<div class="row roster red bold">
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
  <div class="row campaign">
    <div class="red bold">Player Name</div>
    <div></div>
    <div class="red bold">Resources</div>
    <div class="red bold">Current Kill Team Force</div>
    <div>
      <xsl:value-of select="round(../../bs:costs/bs:cost/@value)"/>
      Points
    </div>
  </div>
  <div class="row campaign">
    <div class="red bold">Faction</div>
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
    <div class="red bold">Current Kill Team's Name</div>
    <div></div>
  </div>
  <div class="row campaign">
    <div class="red bold">Mission</div>
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
  <div class="row campaign">
    <div class="red bold">Background</div>
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
  <div class="row campaign">
    <div class="red bold">Squad Quirk</div>
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
  <div class="row roster grey">
    <div>
      <xsl:value-of select="@customName"/>
    </div>
    <div>
      <xsl:value-of select=".//bs:profile[@typeName='Model']/@name"/>
    </div>
    <div>
      <xsl:for-each select=".//bs:profile[@typeName='Weapon' or @typeName='Wargear']">
        <xsl:sort select="@name"/>
          <xsl:if test="../../@number > 1">
            <xsl:value-of select="../../@number"/>x
          </xsl:if>
          <xsl:value-of select="@name"/>,
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
  <div class="card col">
    <div class="title"> <!-- name/points -->
      <div>
        <xsl:value-of select="@customName"/>
      </div>
      <div>
        <xsl:value-of select=".//bs:selection[@type='upgrade' and floor(@number) = @number]/.//bs:category/@name"/>
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
    <div class="row model red bold">
      <div>Name</div>
      <xsl:for-each select="bs:characteristics/bs:characteristic">
        <div>
          <xsl:value-of select="@name"/>
        </div>
      </xsl:for-each>
    </div>
    <div class="row model grey">
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
      <div class="row weapon red bold">
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
    <xsl:call-template name="weapon-row"/>
  </xsl:for-each>

  <xsl:for-each select="bs:selections/bs:selection">
    <xsl:for-each select=".//bs:profile[@typeName='Weapon' or @typeName='Wargear' or @typeName='Special Issue Ammunition']">
      <xsl:sort select="not(@typeName='Wargear')"/>
      <xsl:sort select="not(@typeName='Special Issue Ammunition')"/>
      <xsl:sort select="@typeName"/>
      <xsl:call-template name="weapon-row"/>
    </xsl:for-each>
  </xsl:for-each>

  <!-- weapon row -->

</xsl:template>

<xsl:template name="weapon-row">
    <div class="row weapon grey long-string">
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
  <xsl:for-each select=".//bs:profile[@typeName='Ability' and not(contains($specialisms, ../../../../@name))]">
    <xsl:if test="position()=1">
      <div class="row bold pl3">
        Abilities:
      </div>
    </xsl:if>
    <div class="row weapon grey long-string">
      <div>
        <xsl:value-of select="@name"/>
      </div>
      <div>
        <xsl:value-of select="."/>
      </div>
    </div>
  </xsl:for-each>
  <xsl:for-each select=".//bs:rule">
    <div class="row weapon grey long-string">
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
      <div class="row weapon bold pl3">
        <div>Psyker:</div>
        <div>Manifest <xsl:value-of select="../../../.././/bs:characteristic[@name='Manifest']/."/> | Deny <xsl:value-of select="../../../.././/bs:characteristic[@name='Deny']/."/></div>
      </div>
    </xsl:if>
    <xsl:for-each select=".//bs:characteristic">
      <div class="row weapon grey long-string">
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
      <div class="row bold pl3">
        Specialism: <xsl:value-of select="../../../../@name"/>
      </div>
    </xsl:if>
    <div class="row weapon grey long-string">
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
  <div class="row exp">
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