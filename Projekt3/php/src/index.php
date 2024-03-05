<!DOCTYPE html>
<html>
<head>
    <title>Zobrazení XML Souborů</title>
</head>
<body>
    <h2>Zvolte XML soubor k zobrazení:</h2>
    <form action="" method="post">
        <select name="xml_soubor">
            <option value="">Vyberte soubor</option>
            <?php
            // Získání seznamu všech XML souborů v určitém adresáři
            $soubory = glob('xml/*.xml');
            foreach ($soubory as $soubor) {
                // Získání pouze názvu souboru z celé cesty
                $nazevSouboru = basename($soubor);
                echo "<option value='$soubor'>$nazevSouboru</option>";
            }
            ?>
        </select>
        <input type="submit" value="Zobrazit">
    </form>

    <?php
    if (!empty($_POST['xml_soubor'])) {
        $xmlSoubor = $_POST['xml_soubor'];
        // Získání odpovídajícího XSL souboru na základě názvu XML souboru
        $xslSoubor = str_replace('.xml', '.xsl', $xmlSoubor);

        if (file_exists($xmlSoubor) && file_exists($xslSoubor)) {
            $xml = new DOMDocument;
            $xml->load($xmlSoubor);

            $xsl = new DOMDocument;
            $xsl->load($xslSoubor);

            $xslt = new XSLTProcessor();
            $xslt->importStylesheet($xsl);

            $transformovany_xml = $xslt->transformToXml($xml);
            echo $transformovany_xml;
        } else {
            echo "Nelze načíst XML nebo XSL soubor.";
        }
    }
    ?>
</body>
</html>
