single-file $1 /mydata/references/webdata/$(echo $2$1.html | sed -e 's/[^A-Za-z0-9._-]/_/g') --browser-executable-path /usr/bin/chromium --browser-headless=false
cat /mydata/references/webdata/$(echo $2$1.html | sed -e 's/[^A-Za-z0-9._-]/_/g') | sed -n 's/.*<title>\(.*\)<\/title>.*/\1/ip;T;q' | tr '\n' ' ' | sed -e 's/[^A-Za-z0-9.,_ -]/_/g' | sed -e 's/^[ \t]*//;s/[ \t]*$//'
