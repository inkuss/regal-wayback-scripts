#/bin/bash
echo "*****************************************************************"
echo `date`
echo "Indexiere alle WARCS unter wget-data, je eine .cdx-Datei pro WARC"
echo "*****************************************************************"
logdatei=/opt/wayback/logs/cdxindexer.log # bitte Ausgabe hierhin umleiten
dataverz=/data2/wget-data
owb_verz=/opt/wayback/openwayback
collection_verz=/opt/wayback/openwayback-data/lesesaal
cd $dataverz
for warc in `ls edoweb:*/20*/warcs/*.warc.gz`; do
  echo "warc=$warc"
  cdxindex=`echo $warc | sed 's/\.warc\.gz$/.cdx/'`
  echo "cdxindex=$cdxindex"
  mkdir -p $collection_verz/cdx-dateien/$cdxindex
  rmdir $collection_verz/cdx-dateien/$cdxindex
  cd $owb_verz
  bin/cdx-indexer $dataverz/$warc $collection_verz/cdx-dateien/$cdxindex
  cd $dataverz
done

echo "*****************************************************************"
echo `date`
echo "fertig."
echo "*****************************************************************"

exit 0
