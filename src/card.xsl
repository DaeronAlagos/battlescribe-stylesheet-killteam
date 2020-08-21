<xsl:template match="bs:selection[@type='model']" mode="card">
  <xsl:variable name="nodePoints">
    <xsl:apply-templates mode="points"/>
  </xsl:variable>
  <xsl:variable name="PointsSet" select="exslt:node-set($nodePoints)"/>
  <div class="card">
    <table class="title">
      <tbody> <!-- name/points -->
        <tr>
          <td>
            <xsl:value-of select="@customName"/>
          </td>
          <td>
            <xsl:value-of select=".//bs:selection[@type='upgrade']/.//bs:category[not(contains($levels, @name))]/@name"/>
          </td>
          <td>
            <xsl:value-of select="sum($PointsSet/points)"/>
            Points
          </td>
        </tr>
      </tbody>
    </table>
    <xsl:call-template name="model"/>
    <xsl:call-template name="weapon"/>
    <xsl:call-template name="ability"/>
    <xsl:call-template name="psyker"/>
    <xsl:call-template name="specialism"/>
    <xsl:call-template name="exp"/>
  </div>
</xsl:template>

<xsl:template name="model">
  <xsl:for-each select="bs:profiles/bs:profile[@typeName='Model']">
    <table class="model">
      <thead>
        <tr class="header">
          <th>Name</th>
          <xsl:for-each select="bs:characteristics/bs:characteristic">
            <th>
              <xsl:value-of select="@name"/>
            </th>
          </xsl:for-each>
        </tr> 
      </thead>
      <tbody>
        <tr class="model-data">
          <td>
            <span>
              <xsl:value-of select="@name"/>
            </span>
          </td>
          <xsl:for-each select="bs:characteristics/bs:characteristic">
            <td>
              <span>
                <xsl:value-of select="."/>
              </span>
            </td>
          </xsl:for-each>
        </tr>  
      </tbody>
    </table>
    
  </xsl:for-each>
</xsl:template>

<xsl:template name="weapon">
  <!-- header row -->
  <table class="wargear">
      <xsl:for-each select=".//bs:profile[@typeName='Weapon']">
        <xsl:if test="position()=1">
            <thead>
              <tr>
                <th>
                  <span>Weapon</span>
                </th>
                <xsl:for-each select=".//bs:characteristic">
                  <th>
                    <span>
                      <xsl:value-of select="@name"/>
                    </span>
                  </th>
                </xsl:for-each>    
              </tr>
            </thead>
        </xsl:if>
      </xsl:for-each>
  </table>
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
  <table class="wargear">
    <tbody>
      <tr class="wargear-data">
        <td>
          <xsl:if test="../../@number > 1">
            <xsl:value-of select="../../@number"/>x
          </xsl:if>
          <xsl:value-of select="@name"/>
        </td>
        <xsl:for-each select=".//bs:characteristic">
          <td>
            <xsl:value-of select="."/>
          </td>
        </xsl:for-each>
      </tr>
    </tbody>
  </table>
    
</xsl:template>

<xsl:template name="ability">
  <xsl:variable name="abilities" select=".//bs:profile[@typeName='Ability' and not(contains($specialisms, ../../../../@name))]"/>
  <xsl:for-each select="$abilities">
    <xsl:if test="position()=1">
      <div class="ability-title">
        Abilities:
      </div>
    </xsl:if>
    <table class="ability">
      <tbody>
        <tr>
          <td>
            <xsl:value-of select="@name"/>
          </td>
          <td>
            <xsl:value-of select="."/>
          </td>
        </tr>
      </tbody>
    </table>
  </xsl:for-each>
  <xsl:for-each select=".//bs:rule[not(contains('Markerlight', @name))]">
    <xsl:if test="not($abilities)">
      <xsl:if test="position()=1">
        <div class="ability-title">
          Abilities:
        </div>
      </xsl:if>
    </xsl:if>
    <table class="ability">
      <tbody>
        <tr>
          <td>
            <xsl:value-of select="@name"/>
          </td>
          <td>
            <xsl:value-of select="bs:description/."/>
          </td>    
        </tr>
      </tbody>
    </table>
  </xsl:for-each>
</xsl:template>

<xsl:template name="psyker">
  <xsl:for-each select=".//bs:profile[@typeName='Psychic Power']">
    <xsl:if test="position()=1">
      <table class="ability-title">
        <tbody>
          <tr>
            <td>Psyker:</td>
            <td>Manifest <xsl:value-of select="../../../.././/bs:characteristic[@name='Manifest']/."/> | Deny <xsl:value-of select="../../../.././/bs:characteristic[@name='Deny']/."/></td>    
          </tr>
        </tbody>
      </table>
    </xsl:if>
    <xsl:for-each select=".//bs:characteristic">
      <table class="ability">
        <tbody>
          <tr>
            <td>
              <xsl:value-of select="../../@name"/>
            </td>
            <td>
              <xsl:value-of select="."/>
            </td>
          </tr>
        </tbody>

      </table>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xsl:template name="specialism">
  <xsl:for-each select=".//bs:profile[@typeName='Ability' and contains($specialisms, ../../../../@name)]">
    <xsl:if test="position()=1">
      <table class="ability-title">
        <tbody>
          <tr>
            <td>Specialism:</td>
            <td><xsl:value-of select="../../../../@name"/></td>
          </tr>
        </tbody>
      </table>
    </xsl:if>
    <table class="ability">
      <tbody>
        <tr>
          <td>
            <xsl:value-of select="@name"/>
          </td>
          <td>
            <xsl:value-of select="."/>
          </td>    
        </tr>
      </tbody>
    </table>
  </xsl:for-each>
</xsl:template>

<xsl:template name="exp">
  <div class="card-footer">
    <table class="exp">
      <tfoot>
        <tr>
          <td>Experience: <span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span><span>&#9744;</span></td>
          <td>Flesh Wounds: <span>&#9744;</span><span>&#9744;</span><span>&#9744;</span></td>
          <td>Convalescence: <span>&#9744;</span></td>
          <td>New Recruit: <span>&#9744;</span></td>
        </tr>
      </tfoot>
    </table>
  </div>

</xsl:template>