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