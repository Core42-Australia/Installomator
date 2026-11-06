call42)
    # Core42 in-house app, published by corebrain's ops/release-app.sh (tailnet only).
    # Off the tailnet, or while Call42 is open (it may be recording a meeting), this
    # reports the installed version as latest so the run is a clean no-op.
    name="Call42"
    type="dmg"
    blockingProcesses=( "meetily" )
    c42Feed=$(curl -fsL --max-time 20 "https://corebrain.taildffa04.ts.net/releases/call42/latest.json")
    appNewVersion=$(echo "$c42Feed" | grep -Eo '"version" *: *"[^"]+"' | cut -d'"' -f4)
    downloadURL=$(echo "$c42Feed" | grep -Eo '"url" *: *"[^"]+"' | cut -d'"' -f4)
    if [[ -z "$appNewVersion" || -z "$downloadURL" ]] || pgrep -xq meetily; then
        appNewVersion=$(defaults read "/Applications/Call42.app/Contents/Info" CFBundleShortVersionString 2>/dev/null)
        downloadURL="https://corebrain.taildffa04.ts.net/releases/call42/latest.json"
    fi
    expectedTeamID="BD67RSWGDA"
    ;;
