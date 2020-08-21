<xsl:template name="campaign">
  <table class="campaign">
    <tr>
      <th>Player Name</th>
      <td></td>
      <th>Resources</th>
      <th>Current Kill Team Force</th>
      <td>
        <xsl:value-of select="round(../../bs:costs/bs:cost/@value)"/>
        Points
      </td>
    </tr>
    <tr>
      <th>Faction</th>
      <td>
        <xsl:value-of select="@catalogueName"/>
      </td>
      <td>
        <table class="resources">
          <tr>
            <td><xsl:value-of select=".//bs:selection[@name='Intelligence']/@name"/></td>
            <td><xsl:value-of select=".//bs:selection[@name='Intelligence']/@number"/></td>
          </tr>
        </table>
      </td>
      <th>Current Kill Team's Name</th>
      <td></td>
    </tr>
    <tr>
      <th>Mission</th>
      <td></td>
      <td>
        <table class="resources">
          <tr>
            <td><xsl:value-of select=".//bs:selection[@name='Materiel']/@name"/></td>
            <td><xsl:value-of select=".//bs:selection[@name='Materiel']/@number"/></td>
          </tr>
        </table>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>Background</th>
      <td></td>
      <td>
        <table class="resources">
          <tr>
            <td><xsl:value-of select=".//bs:selection[@name='Morale']/@name"/></td>
            <td><xsl:value-of select=".//bs:selection[@name='Morale']/@number"/></td>
          </tr>
        </table>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>Squad Quirk</th>
      <td></td>
      <td>
        <table class="resources">
          <tr>
            <td><xsl:value-of select=".//bs:selection[@name='Territory']/@name"/></td>
            <td><xsl:value-of select=".//bs:selection[@name='Territory']/@number"/></td>
          </tr>
        </table>
      </td>
      <td></td>
      <td></td>
    </tr>
  </table>

</xsl:template>