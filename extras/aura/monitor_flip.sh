#!/bin/sh

rotation=`kscreen-doctor -j | jq '.outputs[0].rotation'`

if [[ $rotation == "1" ]]; then
  kscreen-doctor output.eDP-1.rotation.inverted
else
  kscreen-doctor output.eDP-1.rotation.normal
fi
