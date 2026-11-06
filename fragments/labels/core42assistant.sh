core42assistant)
    # Core42 in-house app, published by corebrain's ops/release-app.sh (tailnet only).
    # Off the tailnet this reports the installed version as latest (a clean no-op).
    name="Core42 Assistant"
    type="dmg"
    c42Feed=$(curl -fsL --max-time 20 "https://corebrain.taildffa04.ts.net/releases/core42-assistant/latest.json")
    appNewVersion=$(echo "$c42Feed" | grep -Eo '"version" *: *"[^"]+"' | cut -d'"' -f4)
    downloadURL=$(echo "$c42Feed" | grep -Eo '"url" *: *"[^"]+"' | cut -d'"' -f4)
    if [[ -z "$appNewVersion" || -z "$downloadURL" ]]; then
        appNewVersion=$(defaults read "/Applications/Core42 Assistant.app/Contents/Info" CFBundleShortVersionString 2>/dev/null)
        downloadURL="https://corebrain.taildffa04.ts.net/releases/core42-assistant/latest.json"
    fi
    expectedTeamID="BD67RSWGDA"
    ;;
