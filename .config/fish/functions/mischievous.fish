function mischievous --description "Launch Jackett and qBittorrent via mullrun if available"
    if type -q mullrun
        mullrun jackett &
        mullrun qbittorrent &
    else
        jackett &
        qbittorrent &
    end
end
