consultantworkspace)
    # Core42 in-house app, published by corebrain's ops/release-app.sh (tailnet only).
    # Off the tailnet, or while Consultant Workspace is open (a report may be mid-edit),
    # this reports the installed version as latest so the run is a clean no-op.
    name="Consultant Workspace"
    type="dmg"
    blockingProcesses=( "Consultant Workspace" )
    c42Feed=$(curl -fsL --max-time 20 "https://corebrain.taildffa04.ts.net/releases/consultant-workspace/latest.json")
    appNewVersion=$(echo "$c42Feed" | grep -Eo '"version" *: *"[^"]+"' | cut -d'"' -f4)
    downloadURL=$(echo "$c42Feed" | grep -Eo '"url" *: *"[^"]+"' | cut -d'"' -f4)
    if [[ -z "$appNewVersion" || -z "$downloadURL" ]] || pgrep -xq "Consultant Workspace"; then
        appNewVersion=$(defaults read "/Applications/Consultant Workspace.app/Contents/Info" CFBundleShortVersionString 2>/dev/null)
        downloadURL="https://corebrain.taildffa04.ts.net/releases/consultant-workspace/latest.json"
    fi
    expectedTeamID="BD67RSWGDA"
    ;;
