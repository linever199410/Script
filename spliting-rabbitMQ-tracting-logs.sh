Number=1
current_date=$(date +%Y%m%d)
past_date=$(date -d "$current_date - $Number days" +%Y%m%d)
current_name="publish$current_date"
past_name="publish$past_date"
create_url="http://localhost:15672/api/traces/%2fopen/$current_name"
delete_url="http://localhost:15672/api/traces/%2fopen/$past_name"
CURL='/usr/bin/curl'
DELETE_CURLARGS="-i -u username:password -XDELETE"
CREATE_CURLARGS="-i -u username:password -H \"content-type:application/json\" -XPUT"
CREATE_PARAMMET="-d'{\"format\":\"text\",\"pattern\":\"publish.#\"}'"
curl -i -u open.api:open.api -H "content-type:application/json" -XPUT http://localhost:15672/api/traces/%2fopen/$current_name  -d'{"format":"text","pattern":"publish.#"}'
delete_raw="$($CURL $DELETE_CURLARGS $delete_url)"
