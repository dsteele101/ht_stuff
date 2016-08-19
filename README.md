# ht_stuff

ht_inv_response.txt - The response body from a HotelTonight V6 Inventory Request.

  GET /v6/inventory?latitude=30.1530957434975&longitude=-97.84369858144012&num_nights=1 HTTP/1.1
  
ht_sql_queries_001.sql - The SQL statements needed to create a DB and populate it with HotelTonight data. Then query that data for the answers to the first two questions.

ht_sql_responses_001.txt - The responses from ht_sql_queries_001.sql.

ht_sql_queries_002.txt - The SQL statements needed to create a DB and populate it with HotelTonight data. Then query that data for the answers to the last two questions.

ht_sql_responses_002.txt - The responses from ht_sql_queries_002.sql.

Note for when dealing with CSV files. Sometimes they may have extra characters appended to the end. Use sed to get rid of those characters.

Get rid of ^M nonsense at the end of CSV files: 'sed -i -e "s/\r//g" file'
