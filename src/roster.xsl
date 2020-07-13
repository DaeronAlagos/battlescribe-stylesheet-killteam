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