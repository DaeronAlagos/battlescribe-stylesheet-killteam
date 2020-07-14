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