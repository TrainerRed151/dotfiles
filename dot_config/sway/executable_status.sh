#!/usr/bin/env bash

battery() {
  if ! command -v acpi >/dev/null 2>&1; then
    echo "🔋 n/a"
    return
  fi

  b="$(acpi -b | head -n1)"
  pct=$(printf '%s' "$b" | cut -d, -f2 | sed 's/ //')  # e.g. "73%"
  state="${b#*: }"; state="${state%%,*}"

  case "$state" in
    Charging) icon="⚡" ;;
    Discharging) icon="🔋" ;;
    Full) icon="🔌" ;;
    *) icon="🔋" ;;
  esac

  echo "$icon $pct"
}

volume() {
  if [ "$(pamixer --get-mute)" = "true" ]; then
    echo "🔇"
  else
    echo "🔊 $(pamixer --get-volume)%"
  fi
}

network() {
  if ! command -v nmcli >/dev/null 2>&1; then
    echo "Net: n/a"
    return
  fi

  # Find an active connection device/type
  # TYPE will be: ethernet, wifi, etc.
  local line type conn dev
  line="$(nmcli -t -f DEVICE,TYPE,STATE,CONNECTION dev status | awk -F: '$3=="connected"{print; exit}')"

  if [ -z "$line" ]; then
    echo "📡 down"
    return
  fi

  dev="$(echo "$line" | cut -d: -f1)"
  type="$(echo "$line" | cut -d: -f2)"
  conn="$(echo "$line" | cut -d: -f4)"

  if [ "$type" = "ethernet" ]; then
    echo "🔌 eth"
    return
  fi

  if [ "$type" = "wifi" ]; then
    # Get active SSID + signal %
    local ssid sig
    ssid="$(nmcli -t -f ACTIVE,SSID dev wifi | awk -F: '$1=="yes"{print $2; exit}')"
    sig="$(nmcli -t -f IN-USE,SIGNAL dev wifi | awk -F: '$1=="*"{print $2; exit}')"

    # Fallbacks
    [ -z "$ssid" ] && ssid="$conn"
    [ -z "$sig" ] && sig="?"

    echo "📶 ${ssid} ${sig}%"
    return
  fi

  # Anything else (vpn, bt-pan, etc.)
  echo "🌐 ${type}"
}


vpn() {
  if ip link show cscotun0 >/dev/null 2>&1 || ip link show tun0 >/dev/null 2>&1; then
    echo "| 🔒 VPN"
  fi
}

clock() {
  date '+%a %Y-%m-%d %X'
}

while true; do
  printf "%s | %s | %s%s | %s\n" "$(volume)" "$(battery)" "$(network)" "$(vpn)" "$(clock)"
  sleep 1
done
