#!/usr/bin/env bash

# Ulauncher settigns > Shortcuts
# Set Icon
# Set Keyboard
# Paste this

# Set browser and query path of choice
BROWSER_PATH="/usr/bin/google-chrome"
BROWSER_SEARCH_URL_PREFIX="https://www.google.com/search?q="

1=%s

case "$1" in

# GENERAL

email|gmail|mail)
    $BROWSER_PATH 'https://mail.google.com'
    ;;
calendar|cal)
    $BROWSER_PATH 'https://calendar.google.com'
    ;;
jq|jqplay)
    $BROWSER_PATH 'https://jqplay.org/'
    ;;
jsonlint)
    $BROWSER_PATH 'https://jsonlint.com/'
    ;;
yamllint)
    $BROWSER_PATH 'http://www.yamllint.com/'
    ;;
checkregex|checkregexr)
    $BROWSER_PATH 'https://regexr.com/'
    ;;
checkregex1|regex101)
    $BROWSER_PATH 'https://regex101.com/'
    ;;
shellcheck|bashcheck|shelllint)
    $BROWSER_PATH 'https://www.shellcheck.net/'
    ;;
# add more general stuffs you care about shortcuts here

# PERSONAL SHORTCUTS

mysite|mywebsite|myweb)
    $BROWSER_PATH 'https://mysite.com'
    ;;
myshare)
    $BROWSER_PATH 'https://192.168.100.1/share'
    ;;
# add more personal stuffs shortcuts here

# WORK SHORTCUTS

wmail|outlook)
    $BROWSER_PATH 'https://outlook.live.com'
    ;;
# add more work related shortcuts here

# ALL OTHER CONDITIONS NOT MATCHED

*)
    ARGS="$@"
    # BELOW ENSURES CORRECT INTERPRETATION TO DIFFERENTIATE URL REQUEST AND SEARCH QUERIES (SUCH AS 10+5 SHOULD QUERY GOOGLE INSTEAD OF URL REQUEST)
    if [ $# -eq 1 ] && ! [[ $ARGS =~ [^A-Za-z0-9./:] ]] && ! [[ $ARGS =~ [0-9] ]] || [[ "$ARGS" =~ (([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
        $BROWSER_PATH "$1"
    else
	ARGS_STRING="$(echo $*| sed 's/\+/\%2B/g')"
        $BROWSER_PATH "$BROWSER_SEARCH_URL_PREFIX""$ARGS_STRING"
    fi
    ;;
esac
