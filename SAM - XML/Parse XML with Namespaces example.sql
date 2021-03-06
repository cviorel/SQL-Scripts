DECLARE @DOVIZ_KUR TABLE(
		dovizKurList xml)
		
INSERT INTO @DOVIZ_KUR SELECT		
'<ArrayOfDOVIZ_RETURN xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://tempuri.org/"> 
  <DOVIZ_RETURN> 
    <dovizAdi>AMERİKAN DOLARI</dovizAdi> 
    <dovizKodu>USD</dovizKodu> 
    <dovizAlis>1.7928</dovizAlis> 
    <dovizSatis>1.8014</dovizSatis> 
  </DOVIZ_RETURN> 
  <DOVIZ_RETURN> 
    <dovizAdi>KANADA DOLARI</dovizAdi> 
    <dovizKodu>CAD</dovizKodu> 
    <dovizAlis>1.8321</dovizAlis> 
    <dovizSatis>1.8404</dovizSatis> 
  </DOVIZ_RETURN> 
</ArrayOfDOVIZ_RETURN>'

;WITH XMLNAMESPACES('http://tempuri.org/' as MI)
SELECT	
    a.b.value('MI:dovizAdi[1]', 'Varchar(100)') DovizAdi, 
    a.b.value('MI:dovizKodu[1]', 'Varchar(100)') DovizKodu, 
    a.b.value('MI:dovizAlis[1]', 'Varchar(100)') DovizAlis, 
    a.b.value('MI:dovizSatis[1]', 'Varchar(100)') DovizSatis 
FROM @DOVIZ_KUR d
    CROSS APPLY dovizKurList.nodes('/MI:ArrayOfDOVIZ_RETURN/MI:DOVIZ_RETURN')