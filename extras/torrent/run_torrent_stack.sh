#!/usr/bin/env bash

if command -v mullrun >/dev/null 2>&1; then
    mullrun jackett &
    mullrun qbittorrent &
else
    jackett &
    qbittorrent &
fi
