server="dubslice"

if [ -f blackbook_prod_without_gml.sql ]; then
  echo "Warning: blackbook_prod_without_gml.sql already exists, re-using that"
  echo "Delete that file to re-download"
else
  echo "Running dump script on server ..."
  ssh $server "./blackbook-dbdump-without-gml.sh" || exit $?
  echo "Downloading dump..."
  scp $server:~/blackbook_prod_without_gml.sql.gz . || exit $?
  echo "Unpacking..."
  gunzip blackbook_prod_without_gml.sql.gz || exit $?
fi

db="blackbook_staging"
echo "Local mysql: dropping and re-creating $db ..."
mysqladmin drop -f $db
mysqladmin create $db

echo "Local mysql: loading database dump into $db ..."
mysql $db < blackbook_prod_without_gml.sql || exit $?
# echo "DROP TABLE gml_objects" | mysql blackbook_pro

echo "All done"
echo "
SELECT table_name, round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` FROM information_schema.TABLES
WHERE table_schema = "$db";
" | mysql || exit $?
