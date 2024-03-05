<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <head>
        <title>Seznam Studentů</title>
        <link rel="stylesheet" type="text/css" href="student.css"/>
      </head>
      <body>
        <h2>Informace o Studentech</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th style="text-align:left">Jméno</th>
            <th style="text-align:left">Příjmení</th>
            <th style="text-align:left">Student ID</th>
            <th style="text-align:left">Fakulta</th>
          </tr>
          <!-- Předpokládáme, že XML může obsahovat více studentů -->
          <xsl:for-each select="student">
            <tr>
              <td>
                <xsl:value-of select="jmeno"/>
              </td>
              <td>
                <xsl:value-of select="prijmeni"/>
              </td>
              <td>
                <xsl:value-of select="studentid"/>
              </td>
              <td>
                <xsl:value-of select="fakulta"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
