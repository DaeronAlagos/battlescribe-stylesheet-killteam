<xsl:template match="bs:selection[@type='model']" mode="roster">
  <xsl:variable name="nodePoints">
    <xsl:apply-templates mode="points"/>
  </xsl:variable>
  <xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
    <tr class="roster-data">
      <td>
        <xsl:value-of select="@customName"/>
      </td>
      <td>
        <xsl:value-of select=".//bs:profile[@typeName='Model']/@name"/>
      </td>
      <td>
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
      </td>
      <td></td>
      <td style="flex: 2 0;">
        <xsl:for-each select=".//bs:profile[@typeName='Ability' and contains($specialisms, ../../../../@name)]">
          <xsl:value-of select="../../../../@name"/>,
        </xsl:for-each>
        <xsl:for-each select=".//bs:profile[@typeName='Ability' and not(contains($specialisms, ../../../../@name))]">
          <xsl:value-of select="@name"/>,
        </xsl:for-each>
      </td>
      <td></td>
      <td>
        <xsl:value-of select="sum($PointsSet/points)"/>
      </td>
    </tr>
</xsl:template>