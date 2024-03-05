<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
      <title>Informace o Fakultě</title>
      <link rel="stylesheet" type="text/css" href="fakulta.css"/>
    </head>
    <body>
      <h1>Fakulta</h1>
      <h2>Děkan: <xsl:value-of select="fakulta/@děkan"/></h2>
      <xsl:for-each select="fakulta/katedra">
        <div>
          <h3>Katedra: <xsl:value-of select="@zkratka_katedry"/></h3>
          <p>Webové stránky: <a href="{@webové_stránky}"><xsl:value-of select="@webové_stránky"/></a></p>
          <h4>Vedoucí</h4>
          <p>Jméno: <xsl:value-of select="vedoucí/jméno"/></p>
          <p>Email: <xsl:value-of select="vedoucí/email"/></p>
          <h4>Zaměstnanci</h4>
          <xsl:for-each select="zaměstnanci/zaměstnanec">
            <p>Jméno: <xsl:value-of select="jméno"/> - Pozice: <xsl:value-of select="pozice"/></p>
          </xsl:for-each>
          <h4>Předměty</h4>
          <ul>
            <xsl:for-each select="předměty/předmět">
              <li>
                <strong><xsl:value-of select="název"/></strong> (<xsl:value-of select="@zkratka"/>)
                - <xsl:value-of select="@typ"/>, <xsl:value-of select="popis"/>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </xsl:for-each>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>
