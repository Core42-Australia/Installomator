bartender6)
    name="Bartender 6"
    type="dmg"
    downloadURL="https://downloads.macbartender.com/B2/updates/B6Latest/Bartender%206.dmg"
    appNewVersion=$(curl -fsL "https://www.macbartender.com/B2/updates/AppcastB6.xml" | grep -Eo "<sparkle:shortVersionString>[0-9.]+" | sed "s/.*>//" | sort -V | tail -1)
    expectedTeamID="24J875RH8J"
    ;;
